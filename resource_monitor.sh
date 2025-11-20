#!/bin/bash

echo -e
echo -e "#####_System_Resource_Monitor_#####"

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "CPU Usage: $CPU%"

MEM=$(free -h | awk '{print $3 "/" $2}')
echo "Memory Usage: $MEM"

DISK=$(df -h / | awk 'NR==2 {print $5}')
echo "Disk (root): $DISK"

echo -e "\nTop Processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo -e
