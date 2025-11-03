#!/usr/bin/env bash
set -e

IMAGE="wargames"

# Build image if missing
if ! docker image inspect "$IMAGE" >/dev/null 2>&1; then
  docker build -t "$IMAGE" .
fi

# Start container and open a shell
docker run --rm -it \
  -p 8765:8765 \
  "$IMAGE" \
  bash