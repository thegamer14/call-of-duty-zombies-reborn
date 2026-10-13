# Call Of Duty Zombies Re:born

A Plutonium BO2 mod that lets you play the multiplayer maps as Zombies. Adds a
**Quick Launch** page to the main lobby, custom loading screens and menu art,
and a handful of read-only debug commands.

> Built on the original "MP Maps in Zombies" launcher by Liam McCormack.

## What's here

| Path | What it is |
|------|------------|
| `mod/src/` | The mod source (GSC scripts, Lua menus, CSVs, loading-screen images). Packed into `mod.iwd`. |
| `mod/mod.json` | Mod manifest shown by Plutonium (name, version). |
| `tools/build_mod.py` | Packs `mod/src` into `mod/mod.iwd`. |
| `tools/upload_maps.py` | Zips each usermap and uploads it to Pixeldrain; writes `maps.manifest.json`. |
| `installer/Install-Reborn.ps1` | End-user installer: pulls the mod + selected maps and drops them into Plutonium storage. |
| `maps.manifest.json` | Map host manifest (Pixeldrain file IDs + SHA256 checksums) consumed by the installer. |

## Install (players)

1. Make sure Plutonium BO2 is installed and has been run at least once.
2. Open PowerShell and run:

```powershell
powershell -ExecutionPolicy Bypass -File installer\Install-Reborn.ps1
```

Pick the maps you want (or `-All` for everything). The installer downloads the
launcher mod and the selected maps, verifies checksums, and installs them into
`%LOCALAPPDATA%\Plutonium\storage\t6`.

3. Launch Plutonium BO2, enable the `call-of-duty-zombies-reborn` mod, and use
   **Quick Launch** from the main lobby.

## Rebuild the mod (developers)

```powershell
C:\Python314\python.exe tools\build_mod.py
```

This packs `mod/src` into `mod/mod.iwd` and sanity-checks the archive.

## Add / re-upload maps (maintainers)

Set your Pixeldrain API key, then run the uploader. It zips each usermap folder,
uploads it, and records the file ID + SHA256 into `maps.manifest.json`.

```powershell
$env:PIXELDRAIN_API_KEY = "<your key>"
C:\Python314\python.exe tools\upload_maps.py            # all maps
C:\Python314\python.exe tools\upload_maps.py --only zm_hijacked zm_la
```

Maps are read from `%LOCALAPPDATA%\Plutonium\storage\t6\usermaps`. Already-uploaded
maps (present in the manifest with an ID + checksum) are skipped, so you can run
this incrementally as you add maps.

## Hosting

- **Code + installer + manifest** live in this GitHub repo.
- **Map binaries** (~26 GB total) are hosted on [Pixeldrain](https://pixeldrain.com)
  and referenced by `maps.manifest.json`. Pixeldrain free files renew their 60-day
  expiry each time they're downloaded, so popular maps stay up indefinitely.

## Notes

- The launcher mod's internal script namespace is still `mod_to_launch_mp_maps_in_zombies`
  (unchanged from upstream to avoid breaking script references); only the displayed
  name and folder were rebranded.
- The map assets are converted from Activision's multiplayer maps; they are the
  property of their respective owners.

## License

See [LICENSE](LICENSE).
