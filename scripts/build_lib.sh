#!/bin/bash

source "$(dirname "$0")/set_env.sh"

build_binary() {
    local MODULE="$1"
    local OUTPUT_NAME="$2"

    MODULE_PATH="./$MODULE"
    MAIN_FILE="$MODULE_PATH/main.go"
    OUTPUT_PATH="$OUTPUT_DIR/$GOOS-$GOARCH"

    log "Building $OUTPUT_NAME for $GOOS-$GOARCH..."

    if [ ! -f "$MAIN_FILE" ]; then
        log "Skipping $MODULE (no main.go found)"
        return 1
    fi

    mkdir -p "$OUTPUT_PATH"
    GOOS=$GOOS GOARCH=$GOARCH CGO_ENABLED=$CGO_ENABLED \
        go build -o "$OUTPUT_PATH/$OUTPUT_NAME" "$MAIN_FILE"
    chmod +x "$OUTPUT_PATH/$OUTPUT_NAME"

    log "Built $OUTPUT_NAME -> $OUTPUT_PATH/$OUTPUT_NAME"
}
