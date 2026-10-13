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

if (-not $Storage) {
    $Storage = Join-Path $env:LOCALAPPDATA "Plutonium\storage\t6"
}
$ModsDir = Join-Path $Storage "mods"
$UsermapsDir = Join-Path $Storage "usermaps"
$ModFolder = Join-Path $ModsDir "call-of-duty-zombies-reborn"
$Cache = Join-Path $env:TEMP "codz-reborn"

$RawBase = "https://raw.githubusercontent.com/$Repo/main"
$ReleaseApi = "https://api.github.com/repos/$Repo/releases/latest"

function Fetch($Url, $OutFile) {
    Write-Host "  downloading $Url"
    Invoke-WebRequest -Uri $Url -OutFile $OutFile -UseBasicParsing
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

# --- mod package (latest release asset named mod.iwd, else build-less raw) ---
Write-Host "`n[2/4] installing launcher mod"
$modIwd = Join-Path $ModFolder "mod.iwd"
$modJson = Join-Path $ModFolder "mod.json"
try {
    $rel = Invoke-RestMethod -Uri $ReleaseApi -UseBasicParsing
    $asset = $rel.assets | Where-Object { $_.name -eq "mod.iwd" } | Select-Object -First 1
    if ($asset) {
        Fetch $asset.browser_download_url $modIwd
    } else {
        throw "no mod.iwd asset in release"
    }
} catch {
    Write-Warning "  no release asset ($_); downloading raw mod.iwd from repo"
    Fetch "$RawBase/mod/mod.iwd" $modIwd
}
Fetch "$RawBase/mod/mod.json" $modJson
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

# --- download + install maps ---
Write-Host "`n[4/4] installing $($chosen.Count) map(s)"
foreach ($name in $chosen) {
    $entry = $available.$name
    if (-not $entry) { Write-Warning "  $name missing from manifest, skipping"; continue }
    $dest = Join-Path $UsermapsDir $name
    $marker = Join-Path $dest ".installed"
    if ((Test-Path $marker) -and ((Get-Content $marker -Raw).Trim() -eq $entry.sha256)) {
        Write-Host "  $name already installed, skipping"
        continue
    }
    $zip = Join-Path $Cache "$name.zip"
    Write-Host "  $name ($([math]::Round($entry.size / 1MB,1)) MB)"
    Fetch $entry.url $zip
    $actual = Sha256 $zip
    if ($actual -ne $entry.sha256.ToLower()) {
        throw "checksum mismatch for $name (got $actual, want $($entry.sha256))"
    }
    if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }
    Expand-Archive -Path $zip -DestinationPath $dest -Force
    Set-Content -Path $marker -Value $entry.sha256 -NoNewline
    Remove-Item $zip -Force
    Write-Host "    ok -> $dest"
}

Write-Host "`nDone. Launch Plutonium BO2, load the 'call-of-duty-zombies-reborn' mod, and use QUICK LAUNCH in the lobby." -ForegroundColor Green
