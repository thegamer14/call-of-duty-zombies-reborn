"""Pack mod/src into mod/mod.iwd (a deflate zip). Verifies and prints a summary."""
import os
import sys
import zipfile

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(REPO, "mod", "src")
OUT = os.path.join(REPO, "mod", "mod.iwd")


def main():
    if not os.path.isdir(SRC):
        sys.exit("missing mod/src: " + SRC)

    entries = []
    for root, dirs, files in os.walk(SRC):
        dirs.sort()
        for f in sorted(files):
            full = os.path.join(root, f)
            arc = os.path.relpath(full, SRC).replace(os.sep, "/")
            entries.append((full, arc))

    with zipfile.ZipFile(OUT, "w", zipfile.ZIP_DEFLATED) as z:
        for full, arc in entries:
            z.write(full, arc)

    with zipfile.ZipFile(OUT) as z:
        bad = z.testzip()
        if bad is not None:
            sys.exit("corrupt entry: " + str(bad))
        names = z.namelist()
        lua = z.read("ui_mp/t6/menus/quicklaunch.lua").decode("utf-8")
        assert "ZOMBIES RE:BORN" in lua, "rebrand missing from quicklaunch.lua"
        loader = z.read("scripts/zm/_loader.gsc").decode("utf-8")
        assert "fix_solo" in loader and "solo_watch" in loader, "solo fix missing from _loader.gsc"
        assert loader.count("{") == loader.count("}"), "brace mismatch in _loader.gsc"
        modjson = z.read("mod.json").decode("utf-8") if "mod.json" in names else ""
        if modjson:
            assert "Re:born" in modjson, "rebrand missing from mod.json"

    size = os.path.getsize(OUT)
    print("built %s: %d entries, %.2f MB" % (OUT, len(entries), size / 1024.0 / 1024.0))


if __name__ == "__main__":
    main()
