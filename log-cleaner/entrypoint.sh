#!/bin/bash

LOG_DIR="/logs"

mkdir -p "$LOG_DIR"

bash /generate_logs.sh "$LOG_DIR" &

while true; do
    bash /cleanup.sh "$LOG_DIR"
    sleep 30
done
