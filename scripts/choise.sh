#!/bin/bash

echo "💥 Добро пожаловать в тренировку по bash + curl!"
echo "Выберите скрипт для запуска:"
echo "1) fetch_json.sh"
echo "2) check_status.sh"
echo "3) upload_file.sh"
echo "4) download_example.sh"
echo "Введите номер (1–4):"
read choice

case "$choice" in
    1) ./fetch_json.sh ;;
    2) ./check_status.sh ;;
    3) ./upload_file.sh ;;
    4) ./download_example.sh ;;
    *) echo "Неверный выбор" ;;
esac
