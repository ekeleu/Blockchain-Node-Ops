#!/bin/bash
DRIVE="/dev/sda"
MOUNT="/mnt/bitcoin"
LOG_FILE="/home/nodeadmin/Blockchain-Node-Ops/engineering_log.txt"

{
  echo "------------------------------------------------"
  echo "AUDIT DATE: $(date '+%Y-%m-%d %H:%M:%S')"
  echo "Sync Progress: $(bitcoin-cli getblockchaininfo | jq -r '.verificationprogress * 100 | .[0:5]')%"
  
  # Capacity
  USAGE=$(df -h $MOUNT | awk 'NR==2 {print $5}')
  echo "Disk Usage: $USAGE"
  
  # I/O Wait
  IOWAIT=$(iostat -c 1 2 | awk '/^ / {print $4}' | tail -1)
  echo "CPU I/O Wait: $IOWAIT%"
  
  # SMART Wear (Requires sudo, ensure your user has NOPASSWD for smartctl or skip)
  WEAR=$(sudo smartctl -A $DRIVE | grep -i "Percentage Used" | awk '{print $3}' || echo "N/A")
  echo "SSD Wear Level: $WEAR"
} >> "$LOG_FILE"
