#!/usr/bin/env bash
# Downloads the ImmoScout24.ch Switzerland Rental Property Dataset from Kaggle,
# and the GeoNames Switzerland dump (population centers, used for the
# distance-to-nearest-center feature in 02_multifeature_regression.ipynb).
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

echo "Rental dataset downloaded to $DATA_DIR"

curl -L -o "$DATA_DIR/CH.zip" https://download.geonames.org/export/dump/CH.zip
unzip -o "$DATA_DIR/CH.zip" CH.txt -d "$DATA_DIR"
rm "$DATA_DIR/CH.zip"

echo "GeoNames dataset downloaded to $DATA_DIR/CH.txt"