#!/bin/bash
awk -F ':' '{print $1}' /etc/passwd
awk '$0 ~ /root/ {print $0}' /etc/passwd
awk '{sum += $3; count++} END {print "Среднее:", sum/count}' file.txt
echo $(date)
expr 20 - 10
