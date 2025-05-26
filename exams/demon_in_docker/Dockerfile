FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Установим необходимые пакеты
RUN apt update && apt install -y \
    nginx \
    supervisor \
    curl \
    python3 \
    python3-pip \
    && apt clean

# Скопируем конфиги
COPY supervisor.conf /etc/supervisor/conf.d/supervisor.conf
COPY default.conf /etc/nginx/sites-available/default

# Копируем ваш проект (например Flask app или HTML файлы)
COPY . /app
WORKDIR /app

# Делаем скрипт запуска исполняемым
RUN chmod +x start.sh

# Открываем порты
EXPOSE 80 8000

# Запуск через supervisor
CMD ["/usr/bin/supervisord", "-n"]
