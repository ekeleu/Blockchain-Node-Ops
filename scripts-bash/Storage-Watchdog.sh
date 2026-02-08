#!/bin/bash
# Threshold for warning
THRESHOLD=85
USAGE=$(df /mnt/bitcoin | grep / | awk '{ print $5 }' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "[!] ALERT: SSD Usage at ${USAGE}% - Capacity reaching critical levels for 2026 sync." >> ~/Blockchain-Node-Ops/engineering_log.txt
else
    echo "Storage Health: ${USAGE}% used. (226GB remaining)" >> ~/Blockchain-Node-Ops/engineering_log.txt
fi
