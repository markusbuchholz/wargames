#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="${IMAGE_NAME:-mesa_image}"

echo "🛠  Building Docker image '$IMAGE_NAME'…"
docker build . -t "$IMAGE_NAME"
echo "✅ Built '$IMAGE_NAME'"
