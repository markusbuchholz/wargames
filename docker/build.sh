#!/usr/bin/env bash
# set -euo pipefail

# IMAGE_NAME="${IMAGE_NAME:-mesa_image}"

# echo "🛠  Building Docker image '$IMAGE_NAME'…"
# docker build . -t "$IMAGE_NAME"
# echo "✅ Built '$IMAGE_NAME'"

#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

docker build -f $DIR/Dockerfile -t wargames:latest ..