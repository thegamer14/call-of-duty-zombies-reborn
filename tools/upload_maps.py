"""Zip each usermap folder and upload it to Pixeldrain; write maps.manifest.json.

Requires PIXELDRAIN_API_KEY in the environment (free account API key).
Reads usermaps from --usermaps (default: the Plutonium t6 usermaps dir).
Writes maps.manifest.json next to this script's repo root for the installer.
"""
import hashlib
import json
import os
import sys
import time
import zipfile
import urllib.request
import urllib.error

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MANIFEST = os.path.join(REPO, "maps.manifest.json")
WORK = os.path.join(REPO, ".work")
API = "https://pixeldrain.com/api"
DEFAULT_USERMAPS = os.path.join(
    os.environ.get("LOCALAPPDATA", ""), "Plutonium", "storage", "t6", "usermaps"
)


def sha256(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def zip_map(src_dir, zip_path):
    with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as z:
        for root, dirs, files in os.walk(src_dir):
            dirs.sort()
            for f in sorted(files):
                full = os.path.join(root, f)
                arc = os.path.relpath(full, src_dir).replace(os.sep, "/")
                z.write(full, arc)


def upload(zip_path, api_key, retries=4):
    boundary = "----reborn%.0f" % (time.time() * 1000)
    name = os.path.basename(zip_path)
    with open(zip_path, "rb") as f:
        data = f.read()
    body = (
        ("--%s\r\n" % boundary).encode()
        + ('Content-Disposition: form-data; name="file"; filename="%s"\r\n' % name).encode()
        + b"Content-Type: application/octet-stream\r\n\r\n"
        + data
        + ("\r\n--%s--\r\n" % boundary).encode()
    )
    for attempt in range(retries):
        req = urllib.request.Request(
            API + "/file", data=body, method="POST"
        )
        req.add_header("Content-Type", "multipart/form-data; boundary=" + boundary)
        req.add_header("Authorization", api_key)
        try:
            with urllib.request.urlopen(req, timeout=600) as resp:
                out = json.loads(resp.read().decode("utf-8"))
                if out.get("success"):
                    return out["id"]
                raise RuntimeError("upload failed: " + json.dumps(out))
        except urllib.error.HTTPError as e:
            msg = e.read().decode("utf-8", "replace")
            if e.code in (429, 500, 502, 503) and attempt < retries - 1:
                wait = 2 ** (attempt + 1)
                print("  HTTP %s, retrying in %ss: %s" % (e.code, wait, msg[:200]))
                time.sleep(wait)
                continue
            raise RuntimeError("upload HTTP %s: %s" % (e.code, msg[:300]))
    raise RuntimeError("upload failed after retries")


def main():
    api_key = os.environ.get("PIXELDRAIN_API_KEY")
    if not api_key:
        sys.exit("set PIXELDRAIN_API_KEY to your pixeldrain API key")

    import argparse

    p = argparse.ArgumentParser()
    p.add_argument("--usermaps", default=DEFAULT_USERMAPS)
    p.add_argument("--only", nargs="*", help="only these map folder names")
    args = p.parse_args()

    if not os.path.isdir(args.usermaps):
        sys.exit("usermaps dir not found: " + args.usermaps)

    maps = sorted(
        d for d in os.listdir(args.usermaps)
        if os.path.isdir(os.path.join(args.usermaps, d))
    )
    if args.only:
        maps = [m for m in maps if m in set(args.only)]

    manifest = {}
    if os.path.exists(MANIFEST):
        with open(MANIFEST) as f:
            manifest = json.load(f).get("maps", {})

    os.makedirs(WORK, exist_ok=True)
    total = len(maps)
    for i, name in enumerate(maps, 1):
        src = os.path.join(args.usermaps, name)
        entry = manifest.get(name, {})
        if entry.get("id") and entry.get("sha256"):
            print("[%d/%d] %s already uploaded (id=%s), skipping" % (i, total, name, entry["id"]))
            continue

        zip_path = os.path.join(WORK, name + ".zip")
        print("[%d/%d] zipping %s ..." % (i, total, name))
        zip_map(src, zip_path)
        digest = sha256(zip_path)
        size = os.path.getsize(zip_path)
        print("[%d/%d] uploading %s (%.1f MB) ..." % (i, total, name, size / 1048576.0))
        file_id = upload(zip_path, api_key)
        manifest[name] = {
            "id": file_id,
            "size": size,
            "sha256": digest,
            "url": API + "/file/" + file_id,
        }
        print("[%d/%d] %s -> id=%s" % (i, total, name, file_id))
        os.remove(zip_path)

        with open(MANIFEST, "w") as f:
            json.dump(
                {"generated": int(time.time()), "host": "pixeldrain", "maps": manifest},
                f,
                indent=2,
                sort_keys=True,
            )

    print("done. manifest: " + MANIFEST)


if __name__ == "__main__":
    main()
