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
| `mod/mod.iwd` | The packed mod archive (built from `mod/src`). |
| `mod/mod.ff` | The mod fastfile that ships alongside `mod.iwd`. |
| `tools/build_mod.py` | Packs `mod/src` into `mod/mod.iwd`. |
| `tools/update_manifest.py` | Reads the map-host GitHub release and writes `maps.manifest.json` (URLs + SHA256). |
| `installer/Install-Reborn.ps1` | End-user installer: pulls the mod + selected maps and drops them into Plutonium storage. |
| `maps.manifest.json` | Map host manifest consumed by the installer. |

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

## Refresh the map manifest (maintainers)

Map zips are built and released in
[Liam-McCormack-Github/bo2-release-builds](https://github.com/Liam-McCormack-Github/bo2-release-builds).
When a new `usermaps-*` tag is published, regenerate the manifest and commit it:

```powershell
C:\Python314\python.exe tools\update_manifest.py                     # defaults
C:\Python314\python.exe tools\update_manifest.py --tag usermaps-YYYY-MM-DD
```

`GITHUB_TOKEN` in the environment is optional (raises the API rate limit).

## Hosting

- **Code + installer + manifest** live in this GitHub repo.
- **Map binaries** (~20 GB total) are hosted as release assets on the
  [bo2-release-builds](https://github.com/Liam-McCormack-Github/bo2-release-builds/releases)
  repo and referenced by `maps.manifest.json` (URL + size + SHA256 per map).

## Notes

- The launcher mod's internal script namespace is still `mod_to_launch_mp_maps_in_zombies`
  (unchanged from upstream to avoid breaking script references); only the displayed
  name and folder were rebranded.
- The map assets are converted from Activision's multiplayer maps; they are the
  property of their respective owners.

## License

See [LICENSE](LICENSE).
