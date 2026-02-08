#!/bin/bash
# Disk Health & I/O Saturation Monitor for BTC Node
DRIVE="/dev/sda"
MOUNT="/mnt/bitcoin"

echo "--- [$(date)] DISK HEALTH AUDIT ---"

# 1. Capacity Check
USAGE=$(df -h $MOUNT | awk 'NR==2 {print $5}' | sed 's/%//')
echo "Capacity Used: $USAGE%"

# 2. I/O Wait (Check if CPU is bottlenecked by SSD speed)
IOWAIT=$(iostat -c 1 2 | awk '/^ / {print $4}' | tail -1)
echo "CPU I/O Wait: $IOWAIT%"

# 3. SSD Life Expectancy (SMART)
WEAR=$(sudo smartctl -A $DRIVE | grep -i "Percentage Used" | awk '{print $3}')
[ -z "$WEAR" ] && WEAR="N/A"
echo "SSD Wear Level: $WEAR"

# 4. Critical Alerts
if [ "$USAGE" -gt 90 ]; then echo "[!] ALERT: Disk space critical!"; fi
if [ "$IOWAIT" -gt 20 ]; then echo "[!] WARNING: High I/O Wait! SSD is bottlenecking sync."; fi
