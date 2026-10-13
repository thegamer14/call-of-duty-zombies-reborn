"""Generate maps.manifest.json from a GitHub release of usermap zips.

Reads the release assets (name, size, sha256 digest) and the release's
usermap_versions.json (build metadata), and writes maps.manifest.json for
installer/Install-Reborn.ps1 to consume.
"""
import argparse
import json
import os
import sys
import time
import urllib.request

REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(REPO_ROOT, "maps.manifest.json")

API = "https://api.github.com"
DEFAULT_REPO = "Liam-McCormack-Github/bo2-release-builds"
DEFAULT_TAG = "usermaps-2026-10-02"


def get(url, token=None):
    req = urllib.request.Request(url, headers={"User-Agent": "reborn-manifest"})
    if token:
        req.add_header("Authorization", "Bearer " + token)
    with urllib.request.urlopen(req, timeout=60) as resp:
        return resp.read()


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--repo", default=DEFAULT_REPO)
    p.add_argument("--tag", default=DEFAULT_TAG)
    args = p.parse_args()

    token = os.environ.get("GITHUB_TOKEN") or os.environ.get("GH_TOKEN")

    rel = json.loads(
        get("%s/repos/%s/releases/tags/%s" % (API, args.repo, args.tag), token)
    )

    # build metadata (optional, best effort)
    build_info = {}
    for asset in rel["assets"]:
        if asset["name"] == "usermap_versions.json":
            try:
                data = json.loads(get(asset["browser_download_url"], token))
                build_info = data.get("maps", {})
            except Exception as e:
                print("warning: could not read usermap_versions.json: %s" % e)
            break

    maps = {}
    for asset in rel["assets"]:
        name = asset["name"]
        if not name.endswith(".zip"):
            continue
        map_name = name[: -len(".zip")]
        digest = asset.get("digest") or ""
        sha256 = digest.split(":", 1)[1] if ":" in digest else ""
        if not sha256:
            print("warning: %s has no sha256 digest, skipping" % name)
            continue
        entry = {
            "url": asset["browser_download_url"],
            "size": asset["size"],
            "sha256": sha256,
        }
        meta = build_info.get(map_name)
        if meta:
            entry["build_id"] = meta.get("build_id", "")
            entry["built_at"] = meta.get("built_at", "")
        maps[map_name] = entry

    if not maps:
        sys.exit("no map zips found in release %s@%s" % (args.repo, args.tag))

    manifest = {
        "generated": int(time.time()),
        "host": "github-release",
        "source": {"repo": args.repo, "tag": args.tag},
        "maps": dict(sorted(maps.items())),
    }
    with open(OUT, "w") as f:
        json.dump(manifest, f, indent=2, sort_keys=False)
        f.write("\n")

    total = sum(m["size"] for m in maps.values())
    print("wrote %s: %d maps, %.1f GB from %s@%s" % (
        OUT, len(maps), total / (1024 ** 3), args.repo, args.tag))


if __name__ == "__main__":
    main()
