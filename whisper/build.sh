#!/bin/bash

set -e  # Exit on error
set -o pipefail  # Exit on pipeline error

# Define variables
REPO_URL="https://github.com/OpenNMT/CTranslate2.git"
TMP_DIR=$(mktemp -d)
IMAGE_NAME="pando85/wyoming-whisper:1.1.0"

# Clone repository to a temporary directory
git clone --recursive "$REPO_URL" "$TMP_DIR"

# Move specific directories and files
mv "$TMP_DIR"/{third_party,cli,include,src,cmake,python} .

# Move specific files
mv "$TMP_DIR"/{CMakeLists.txt,README.md} .

# Build Docker image
DOCKER_BUILDKIT=0 docker build . --tag "$IMAGE_NAME"

# Cleanup: Remove temporary directory
rm -rf "$TMP_DIR"

echo "Script executed successfully."
