#!/usr/bin/env bash
# Downloads the ImmoScout24.ch Switzerland Rental Property Dataset from Kaggle.
#
# Prerequisites:
#   1. pip install kaggle   (already in requirements.txt)
#   2. A Kaggle account + API token:
#      Kaggle -> profile -> Settings -> API -> "Create New Token"
#      This downloads kaggle.json -> place it at ~/.kaggle/kaggle.json
#      (chmod 600 ~/.kaggle/kaggle.json)
#
# Usage: ./data/download_data.sh   (run from repo root)

set -euo pipefail

DATA_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

kaggle datasets download \
  -d fredeys/immoscout24-ch-switzerland-rental-property-dataset \
  -p "$DATA_DIR" \
  --unzip

echo "Dataset downloaded to $DATA_DIR"