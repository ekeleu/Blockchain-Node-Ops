#!/bin/bash
DRIVES=("/" "/mnt/bitcoin" "/mnt/blockchain_nvme")
echo "--- Blockchain Storage Health Check ---"
for dir in "${DRIVES[@]}"; do
    if mountpoint -q "$dir"; then
        usage=$(df -h "$dir" | awk 'NR==2 {print $5}' | sed 's/%//')
        echo "$dir is at ${usage}% capacity."
    else
        echo "ERROR: $dir NOT mounted."
    fi
done
