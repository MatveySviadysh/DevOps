#!/bin/bash

while true; do
    echo "==== Monitoring System Resources ===="
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)"
    echo "Memory Usage:"
    free -h
    echo "Disk Usage:"
    df -h
    echo "--------------------------------------"
    sleep 5
done
