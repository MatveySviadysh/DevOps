#!/bin/bash

LOG_DIR=$1

if [ -z "$LOG_DIR" ]; then
    echo "Log directory not provided"
    exit 1
fi

find "$LOG_DIR" -type f -mmin +1 -exec rm -v {} \;
