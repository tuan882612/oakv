#!/bin/bash

set -e

OUTPUT_DIR="$(pwd)/bin"

mkdir -p "$OUTPUT_DIR"

build_module() {
  local MODULE="$1"
  local PLATFORM="$2"

  local OS=$(echo $PLATFORM | cut -d'-' -f1)
  local ARCH=$(echo $PLATFORM | cut -d'-' -f2)

  echo "Building module: $MODULE for $PLATFORM..."

  local MODULE_PATH="./$MODULE"
  
  if [ ! -d "$MODULE_PATH" ] || [ -z "$(find "$MODULE_PATH" -name '*.go' -print -quit)" ]; then
    echo "Skipping module: $MODULE (no Go files found)"
    return
  fi

  cd "$MODULE_PATH"

  local OUTPUT_DIR_PER_PLATFORM="$OUTPUT_DIR/$PLATFORM"
  mkdir -p "$OUTPUT_DIR_PER_PLATFORM"
  local OUTPUT="$OUTPUT_DIR_PER_PLATFORM/oakv"

  if [ "$OS" == "windows" ]; then
    OUTPUT+=".exe"
  fi

  echo "Building $MODULE for $PLATFORM..."
  GOOS=$OS GOARCH=$ARCH go build -o "$OUTPUT" .

  cd - > /dev/null
}

PLATFORM="$1"

MODULES=("oakvctl" "server" "core")

for MODULE in "${MODULES[@]}"; do
  build_module "$MODULE" "$PLATFORM"
done
