#!/bin/bash



FOLDER_LOG="/var/log/nginx/"


for FILE in $FOLDER_LOG*; do
    if [ -f "$FILE" ]; then
        FILE_MOD_TIME=$(stat -c %Y "$FILE")
        CURRENT_TIME=$(date +%s)
        if [ $FILE_MOD_TIME -lt $((CURRENT_TIME - 86400)) ]; then
            echo "$FILE is old"
        fi 
    fi
done





