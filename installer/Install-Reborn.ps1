# Call Of Duty Zombies Re:born installer
# Installs the launcher mod + selected zombie maps into Plutonium storage\t6.
# Run:  powershell -ExecutionPolicy Bypass -File Install-Reborn.ps1 [-Maps zm_hijacked,zm_la] [-All]

param(
    [string]$Maps = "",
    [switch]$All,
    [string]$Repo = "thegamer14/call-of-duty-zombies-reborn",
    [string]$Storage = ""
)

$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Add-Type -AssemblyName System.IO.Compression.FileSystem

if (-not $Storage) {
    $Storage = Join-Path $env:LOCALAPPDATA "Plutonium\storage\t6"
}
$ModsDir = Join-Path $Storage "mods"
$UsermapsDir = Join-Path $Storage "usermaps"
$ModFolder = Join-Path $ModsDir "call-of-duty-zombies-reborn"
$Cache = Join-Path $env:TEMP "codz-reborn"

$RawBase = "https://raw.githubusercontent.com/$Repo/main"

function Fetch($Url, $OutFile) {
    for ($i = 1; $i -le 3; $i++) {
        try {
            Write-Host "  downloading $Url"
            Invoke-WebRequest -Uri $Url -OutFile $OutFile -UseBasicParsing
            return
        } catch {
            if ($i -eq 3) { throw }
            Write-Warning "  attempt $i failed ($($_.Exception.Message)); retrying..."
            Start-Sleep -Seconds (3 * $i)
        }
    }
}

function Sha256($Path) {
    (Get-FileHash -Path $Path -Algorithm SHA256).Hash.ToLower()
}

Write-Host "== Call Of Duty Zombies Re:born installer ==" -ForegroundColor Green
Write-Host "storage: $Storage"

if (-not (Test-Path $Storage)) {
    throw "Plutonium t6 storage not found at $Storage. Is Plutonium BO2 installed?"
}

New-Item -ItemType Directory -Force -Path $Cache | Out-Null
New-Item -ItemType Directory -Force -Path $ModFolder | Out-Null
New-Item -ItemType Directory -Force -Path $UsermapsDir | Out-Null

# --- manifest ---
$manifestPath = Join-Path $Cache "maps.manifest.json"
Write-Host "`n[1/4] fetching map manifest"
Fetch "$RawBase/maps.manifest.json" $manifestPath
$manifest = Get-Content $manifestPath -Raw | ConvertFrom-Json
$available = $manifest.maps
if (-not $available) { throw "map manifest has no maps" }
Write-Host "  $($available.PSObject.Properties.Count) maps from $($manifest.source.repo)@$($manifest.source.tag)"

# --- mod package ---
Write-Host "`n[2/4] installing launcher mod"
$modIwd = Join-Path $ModFolder "mod.iwd"
$modJson = Join-Path $ModFolder "mod.json"
$modFf = Join-Path $ModFolder "mod.ff"
Fetch "$RawBase/mod/mod.iwd" $modIwd
Fetch "$RawBase/mod/mod.json" $modJson
Fetch "$RawBase/mod/mod.ff" $modFf
Write-Host "  mod installed -> $ModFolder"

# --- choose maps ---
$names = $available.PSObject.Properties.Name | Sort-Object
if ($All) {
    $chosen = $names
} elseif ($Maps) {
    $chosen = $Maps.Split(",") | ForEach-Object { $_.Trim() } | Where-Object { $_ }
    foreach ($m in $chosen) {
        if (-not ($names -contains $m)) { throw "unknown map '$m'. available: $($names -join ', ')" }
    }
} else {
    Write-Host "`n[3/4] available maps:" -ForegroundColor Yellow
    for ($i = 0; $i -lt $names.Count; $i++) {
        $sz = [math]::Round($available.($names[$i]).size / 1MB, 1)
        Write-Host ("  {0,2}) {1,-18} {2} MB" -f ($i + 1), $names[$i], $sz)
    }
    $sel = Read-Host "`nEnter map numbers/names (comma separated), or 'all'"
    if ($sel.Trim() -eq "all") {
        $chosen = $names
    } else {
        $chosen = $sel.Split(",") | ForEach-Object {
            $t = $_.Trim()
            if ($t -match '^\d+$') { $names[[int]$t - 1] } else { $t }
        }
    }
}
if (-not $chosen -or $chosen.Count -eq 0) { throw "no maps selected" }

# --- download + install maps ---
Write-Host "`n[4/4] installing $($chosen.Count) map(s)"
$installedCount = 0
$skippedCount = 0
foreach ($name in $chosen) {
    $entry = $available.$name
    if (-not $entry) { Write-Warning "  $name missing from manifest, skipping"; continue }
    $dest = Join-Path $UsermapsDir $name
    $marker = Join-Path $dest ".installed"
    $versionFile = Join-Path $dest "version.json"

    # already installed? marker sha match, or matching build id (heals empty/missing markers)
    $have = $null
    if (Test-Path $marker) {
        try { $have = ([IO.File]::ReadAllText($marker)).Trim() } catch { }
    }
    if ($have -and $entry.sha256 -and $have -eq $entry.sha256.ToLower()) {
        Write-Host "  $name already installed, skipping"
        $skippedCount++
        continue
    }
    $isCurrent = $false
    if ((Test-Path $versionFile) -and $entry.build_id) {
        try {
            $localBuild = (Get-Content $versionFile -Raw | ConvertFrom-Json).build_id
            if ($localBuild -eq $entry.build_id) { $isCurrent = $true }
        } catch { }
    }
    if ($isCurrent) {
        [IO.File]::WriteAllText($marker, $entry.sha256)
        Write-Host "  $name already installed (build $($entry.build_id)), skipping"
        $skippedCount++
        continue
    }

    $zip = Join-Path $Cache "$name.zip"
    Write-Host "  $name ($([math]::Round($entry.size / 1MB,1)) MB)"
    Fetch $entry.url $zip
    if ($entry.sha256) {
        $actual = Sha256 $zip
        if ($actual -ne $entry.sha256.ToLower()) {
            Remove-Item $zip -Force
            throw "checksum mismatch for $name (got $actual, want $($entry.sha256))"
        }
    } elseif ((Get-Item $zip).Length -ne $entry.size) {
        Remove-Item $zip -Force
        throw "size mismatch for $name"
    }

    # zip contains a top-level <name>/ folder; extract via temp and move into place
    $tmp = Join-Path $Cache "extract_$name"
    if (Test-Path $tmp) { Remove-Item $tmp -Recurse -Force }
    [IO.Compression.ZipFile]::ExtractToDirectory($zip, $tmp)
    $src = Join-Path $tmp $name
    if (-not (Test-Path $src)) { $src = $tmp }
    if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }
    Move-Item $src $dest
    if (Test-Path $tmp) { Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue }
    [IO.File]::WriteAllText((Join-Path $dest ".installed"), $entry.sha256)
    Remove-Item $zip -Force
    Write-Host "    ok -> $dest"
    $installedCount++
}

Write-Host "`nDone: $installedCount installed, $skippedCount already present." -ForegroundColor Green
Write-Host "Launch Plutonium BO2, enable the 'call-of-duty-zombies-reborn' mod in the launcher,"
Write-Host "and use QUICK LAUNCH in the lobby." -ForegroundColor Green
