#!/usr/bin/env bash
set -Eeuo pipefail

echo "Preparing AURORA Gaming OS image..."

# Copy optional system configuration into the image.
if [[ -d /ctx/system_files ]]; then
    cp -a /ctx/system_files/. /
fi

# Keep this first image deliberately close to the tested Bazzite base.
# Add AURORA packages and services in separate, reviewable changes.
echo "AURORA base image preparation complete."
