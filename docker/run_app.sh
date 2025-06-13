#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="${IMAGE_NAME:-mesa_image}"
CONTAINER_NAME="${CONTAINER_NAME:-mesa_instance}"
HOST_PORT="${HOST_PORT:-8765}"
#MODEL_DIR="${MODEL_DIR:-/opt/mesa-main/mesa/examples/basic/schelling}"

# ─── BASIC EXAMPLES ────────────────────────────
#MODEL_DIR="${MODEL_DIR:-/opt/mesa-main/mesa/examples/basic/boltzmann_wealth_model}"
#MODEL_DIR="${MODEL_DIR:-/opt/mesa-main/mesa/examples/basic/boid_flockers}"
MODEL_DIR="${MODEL_DIR:-/opt/mesa-main/mesa/examples/basic/conways_game_of_life}"
#MODEL_DIR="${MODEL_DIR:-/opt/mesa-main/mesa/examples/basic/schelling}"
#MODEL_DIR="${MODEL_DIR:-/opt/mesa-main/mesa/examples/basic/virus_on_network}"

# ─── ADVANCED EXAMPLES ───────
#MODEL_DIR="${MODEL_DIR:-/opt/mesa-main/mesa/examples/advanced/epstein_civil_violence}"
#MODEL_DIR="${MODEL_DIR:-/opt/mesa-main/mesa/examples/advanced/pd_grid}"
#MODEL_DIR="${MODEL_DIR:-/opt/mesa-main/mesa/examples/advanced/sugarscape_g1mt}"
#MODEL_DIR="${MODEL_DIR:-/opt/mesa-main/mesa/examples/advanced/wolf_sheep}"


echo "▶️ Running container '$CONTAINER_NAME' from '$IMAGE_NAME'"
echo "   MODEL_DIR=$MODEL_DIR"
docker run --rm \
  --name "$CONTAINER_NAME" \
  -p "$HOST_PORT:8765" \
  -e MODEL_DIR="$MODEL_DIR" \
  -it "$IMAGE_NAME"
