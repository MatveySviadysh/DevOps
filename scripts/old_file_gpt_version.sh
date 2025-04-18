#!/bin/bash

TARGET_DIR="/path/to/logs"
ARCHIVE_LOG="/path/to/archive.log"
MAX_AGE=30

if [ ! -d "$TARGET_DIR" ]; then
    echo "Ошибка: Директория $TARGET_DIR не существует!"
    exit 1
fi

if [ ! -f "$ARCHIVE_LOG" ]; then
    touch "$ARCHIVE_LOG"
fi

echo "Начало проверки старых файлов: $(date)" >> "$ARCHIVE_LOG"

for FILE in "$TARGET_DIR"/*; do
    if [ -f "$FILE" ]; then
        FILE_MOD_TIME=$(stat -c %Y "$FILE")
        CURRENT_TIME=$(date +%s)
        AGE=$(( (CURRENT_TIME - FILE_MOD_TIME) / 86400 ))

        if [ "$AGE" -gt "$MAX_AGE" ]; then
            echo "$(date '+%Y-%m-%d %H:%M:%S') — Удален файл: $FILE, возраст: $AGE дней" >> "$ARCHIVE_LOG"
            rm "$FILE" # Удаляем файл
        fi
    fi
done

echo "Проверка завершена. Оставшиеся файлы:" >> "$ARCHIVE_LOG"

for FILE in "$TARGET_DIR"/*; do
    if [ -f "$FILE" ]; then
        FILE_SIZE=$(stat -c %s "$FILE")
        echo "$FILE — $FILE_SIZE байт" >> "$ARCHIVE_LOG"
    fi
done

echo "Конец проверки старых файлов: $(date)" >> "$ARCHIVE_LOG"
