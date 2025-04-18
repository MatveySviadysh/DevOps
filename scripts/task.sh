#!/bin/bash

if [ -z "$1" ]; then
  echo "Укажите путь к директории."
  exit 1
fi

if [ ! -d "$1" ]; then
  echo "Директория '$1' не найдена."
  exit 2
fi

find "$1" -type f | while read file; do
  file_size=$(du -m "$file" | cut -f1)

  if [ "$file_size" -gt 100 ]; then
    echo "Файл: $file, Размер: ${file_size}MB"
  fi
done
