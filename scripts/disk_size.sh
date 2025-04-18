#!/bin/bash

THRESHOLD=30

usage1=$(df /dev/nvme0n1p7 | awk 'NR==2 {gsub("%", "", $5); print $5}')
usage2=$(df /dev/nvme0n1p1 | awk 'NR==2 {gsub("%", "", $5); print $5}')

echo "Использование /dev/nvme0n1p7: $usage1%"
echo "Использование /dev/nvme0n1p1: $usage2%"

total_usage=$((usage1 + usage2))
echo "Суммарное использование: $total_usage%"  

LOGFILE="$HOME/disk_size_use.log"

echo "$(date): Total usage = $total_usage%" >> "$LOGFILE"

if [[ $usage1 -gt $THRESHOLD ]] || [[ $usage2 -gt $THRESHOLD ]]; then
    echo "Предупреждение: использование диска превысило ${THRESHOLD}%" | tee -a "$LOGFILE"
else
    echo "Всё в порядке: использование дисков в норме" | tee -a "$LOGFILE"
fi
