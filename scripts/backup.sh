#!/bin/bash

current_time=$(date +"%H-%M-%S")

if [ -z "$1" ]; then
  echo "Укажите имя файла в качестве аргумента"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "Файл '$1' не найден"
  exit 2
fi

backup_file="${1}_backup_${current_time}"

cp "$1" "$backup_file"
echo "✅ Ваш бекап готов: $backup_file"
