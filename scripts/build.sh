#!/bin/bash

set -e

source "$(dirname "$0")/build_lib.sh"

PLATFORM="${1:-$GOOS-$GOARCH}"
GOOS=$(echo "$PLATFORM" | cut -d'-' -f1)
GOARCH=$(echo "$PLATFORM" | cut -d'-' -f2)

log "Starting build for $PLATFORM..."

build_binary "server" "oakv"
build_binary "oakvctl" "oakvctl"

log "Build complete. Binaries are located in $OUTPUT_DIR/$PLATFORM"
