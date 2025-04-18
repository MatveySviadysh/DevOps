#!/bin/bash

ERROR_COUNT=0

while true; do
    TIME=$(date '+%Y-%m-%d %H:%M:%S')

    if ping -c 1 -W 2 "$1" > /dev/null; then
        echo "$1 - $TIME доступен"
    else
        echo "$1 - $TIME не доступен"
        ((ERROR_COUNT++))
    fi


	FILE_SIZE=$(stat -c%s "$LOG_FILE" 2>/dev/null || echo 0)
    if [ "$FILE_SIZE" -gt "$MAX_SIZE" ]; then
        ARCHIVE_NAME="$ARCHIVE_DIR/server_check_$(date '+%Y%m%d_%H%M%S').log.gz"
        gzip -c "$LOG_FILE" > "$ARCHIVE_NAME"
        > "$LOG_FILE"
        echo "$TIMESTAMP — Архив создан: $ARCHIVE_NAME"
    fi

	
    echo "Ошибок: $ERROR_COUNT"
    sleep 10
done
