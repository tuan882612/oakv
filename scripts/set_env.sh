#!/bin/bash

GOOS="${GOOS:-$(go env GOOS)}"
GOARCH="${GOARCH:-$(go env GOARCH)}"
CGO_ENABLED="${CGO_ENABLED:-0}"

OUTPUT_DIR="$(pwd)/bin"
mkdir -p "$OUTPUT_DIR"

log() {
  echo "[build] $@"
}
