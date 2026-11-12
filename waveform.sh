#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 3 ]]; then
    echo "Usage: $0 <image> <audio> <output.mp4>"
    exit 1
fi

IMAGE="$1"
AUDIO="$2"
OUTPUT="$3"

if ! command -v ffmpeg &> /dev/null; then
    echo "Error: FFmpeg is not installed or not available in PATH."
    echo "Please install FFmpeg before running this script."
    exit 1
fi

if [[ ! -f "$IMAGE" ]]; then
    echo "Error: Image file not found: $IMAGE" >&2
    exit 1
fi

if [[ ! -f "$AUDIO" ]]; then
    echo "Error: Audio file not found: $AUDIO" >&2
    exit 1
fi

ffmpeg -y \
    -loop 1 \
    -framerate 30 \
    -i "$IMAGE" \
    -i "$AUDIO" \
    -filter_complex \
    "[1:a]showwaves=s=1920x300:mode=line:colors=white:rate=30,format=rgba[wave]; \
     [0:v]format=rgba[bg]; \
     [bg][wave]overlay=(W-w)/2:H-h-50:shortest=1[v]" \
    -map "[v]" \
    -map 1:a \
    -c:v libx264 \
    -preset medium \
    -crf 18 \
    -c:a aac \
    -b:a 320k \
    -pix_fmt yuv420p \
    -shortest \
    "$OUTPUT"

echo "Video successfully generated: $OUTPUT"
