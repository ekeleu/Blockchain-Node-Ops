#!/bin/bash
# Monitor for blocks larger than 3.5MB (Ordinals/Heavy Data)
LOG="/mnt/bitcoin/debug.log"

echo "--- Heavy Block Monitor Started ---"
echo "Listening to: $LOG"

tail -f "$LOG" | while read -r line; do
    # Trigger on every 'UpdateTip' line
    if [[ "$line" == *"UpdateTip"* ]]; then
        # Extract height using a more resilient regex
        HEIGHT=$(echo "$line" | grep -oP 'height=\K[0-9]+')
        
        # Query the node for the actual size (in bytes)
        SIZE=$(bitcoin-cli getblock $(bitcoin-cli getblockhash $HEIGHT) | jq '.size')
        
        # Print a heartbeat so you know it's alive
        echo "Validated Height: $HEIGHT | Size: $((SIZE / 1024)) KB"

        # Alert if larger than 3.5MB (3,500,000 bytes)
        if [ "$SIZE" -gt 3900000 ]; then
             echo -e "\n\033[1;31m[!] HEAVY BLOCK DETECTED: Height $HEIGHT | Size: $(bc <<< "scale=2; $SIZE/1048576") MB\033[0m\n"
        fi
    fi
done
