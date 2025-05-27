#!/bin/bash

LOG_DIR=$1

mkdir -p "$LOG_DIR"

while true; do
    echo "{\"timestamp\": \"$(date)\", \"message\": \"Random value: $RANDOM\"}" >> "$LOG_DIR/log_$(date +%Y%m%d%H%M%S).json"
    sleep 5
done
