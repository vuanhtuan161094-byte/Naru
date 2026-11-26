#!/usr/bin/env bash
# Run on a local machine with a display and ffmpeg. Never upload private art.
set -euo pipefail
if [ "$#" -ne 3 ]; then echo "usage: capture-private.sh GODOT PROJECT_DIR PRIVATE_JSON" >&2; exit 2; fi
GODOT=$(realpath "$1")
PROJECT=$(realpath "$2")
PACK=$(realpath "$3")
OUT=$(pwd)/private-combat-review
mkdir -p "$OUT"
"$GODOT" --headless --path "$PROJECT" --editor --import --quit >"$OUT/import.log" 2>&1
"$GODOT" --path "$PROJECT" --resolution 1280x720 --position 0,0 -- --combat-video --private-capture "--art-pack=$PACK" >"$OUT/runtime.log" 2>&1 &
PID=$!
trap 'kill "$PID" 2>/dev/null || true' EXIT
for i in $(seq 1 30); do
  if grep -q NARU_PRIVATE_CAPTURE_FAIL "$OUT/runtime.log"; then cat "$OUT/runtime.log"; exit 1; fi
  if grep -q NARU_PRIVATE_CAPTURE_ART_READY "$OUT/runtime.log" && grep -q NARU_VIDEO_BATTLE "$OUT/runtime.log"; then break; fi
  kill -0 "$PID"
  sleep 1
done
grep NARU_PRIVATE_CAPTURE_ART_READY "$OUT/runtime.log"
grep NARU_VIDEO_BATTLE "$OUT/runtime.log"
ffmpeg -hide_banner -loglevel error -y -f x11grab -video_size 1280x720 -framerate 20 -i "${DISPLAY:-:0}" -t 24 -c:v libx264 -preset veryfast -pix_fmt yuv420p "$OUT/Combat-private.mp4"
! grep -E 'SCRIPT ERROR|Parse Error|NARU_PRIVATE_CAPTURE_FAIL' "$OUT/runtime.log"
test -s "$OUT/Combat-private.mp4"
echo "$OUT/Combat-private.mp4"
