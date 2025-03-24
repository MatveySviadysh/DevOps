# Руководство по настройке

### Шаг 1: Установка зависимостей
1. Установите необходимые пакеты:
   ```bash
   sudo apt-get install python3-pip python3-dev

    Установите зависимости с помощью pip:

    pip install -r requirements.txt

Шаг 2: Настройка Redis

    Запустите Redis сервер:

redis-server

Убедитесь, что Redis работает, с помощью:

    redis-cli ping

Шаг 3: Настройка Docker

    Установите Docker и Docker Compose:

sudo apt-get install docker docker-compose

Запустите приложение:

docker-compose up --build
