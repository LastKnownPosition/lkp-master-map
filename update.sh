#!/usr/bin/env bash
# Refresh the published map from the (private) Maritime workspace and push it
# live to GitHub Pages. Run this after regenerating the map:
#   python3 pipeline/maritime.py mastermap   (in the Maritime repo)
#   ./update.sh                              (here)
set -e
SRC="/Users/nickmitrou/Documents/Youtube/Maritime/brand/mastermap/index.html"
DIR="$(cd "$(dirname "$0")" && pwd)"

cp "$SRC" "$DIR/index.html"
cd "$DIR"
git add index.html
if git diff --cached --quiet; then
  echo "No changes — the live map is already up to date."
  exit 0
fi
git commit -m "Update master map ($(date +%Y-%m-%d))"
git push
echo "Pushed. GitHub Pages will refresh in about a minute."
