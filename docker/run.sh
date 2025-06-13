#!/usr/bin/env bash
set -euo pipefail

# Usage: ./run.sh [example_folder] [port]
# Defaults:
EXAMPLE="${1:-conways_game_of_life_fast}"
HOST_PORT="${2:-8765}"
IMAGE_NAME="${IMAGE_NAME:-mesa_image}"
CONTAINER_NAME="mesa_shell_${EXAMPLE}"

MODEL_DIR="/opt/mesa-examples/examples/${EXAMPLE}"

echo "▶️  Spinning up container '$CONTAINER_NAME' (will drop you to a shell)…"
echo "    MODEL_DIR=$MODEL_DIR"
echo "    Port mapping: $HOST_PORT → 8765"

docker run --rm \
  --name "$CONTAINER_NAME" \
  -p "$HOST_PORT:8765" \
  -e MODEL_DIR="$MODEL_DIR" \
  --entrypoint /bin/bash \
  -it "$IMAGE_NAME"
