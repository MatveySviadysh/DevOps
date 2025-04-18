#!/bin/bash

# Параметры пороговых значений
CPU_THRESHOLD=90   # Процент загрузки процессора
MEM_THRESHOLD=80   # Процент использования памяти
DISK_THRESHOLD=90  # Процент использования диска

# Функция для отправки уведомлений
send_alert() {
  local message="$1"
  echo "$message" | mail -s "Warning: Server Resource Alert" your_email@example.com
}

# Проверка загрузки процессора
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
  send_alert "High CPU Usage: $cpu_usage% (Threshold: $CPU_THRESHOLD%)"
fi

# Проверка использования памяти
mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
if (( $(echo "$mem_usage > $MEM_THRESHOLD" | bc -l) )); then
  send_alert "High Memory Usage: $mem_usage% (Threshold: $MEM_THRESHOLD%)"
fi

# Проверка использования диска
disk_usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
if [ "$disk_usage" -gt "$DISK_THRESHOLD" ]; then
  send_alert "High Disk Usage: $disk_usage% (Threshold: $DISK_THRESHOLD%)"
fi

# Выводим метрики на экран
echo "CPU Usage: $cpu_usage%"
echo "Memory Usage: $mem_usage%"
echo "Disk Usage: $disk_usage%"

