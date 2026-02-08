#!/bin/bash
# Triple-Node Environment Monitor (BTC/ETH/ASA)
LOG="/home/nodeadmin/Blockchain-Node-Ops/engineering_log.txt"

{
  echo "=== GLOBAL NODE HEALTH CHECK: $(date) ==="
  
  # 1. Thermal Monitoring (Critical for Dell Precision/NVMe)
  TEMP=$(sensors | grep "Package id 0" | awk '{print $4}')
  echo "CPU Thermal State: $TEMP"
  
  # 2. Bitcoin Node Status
  BTC_SYNC=$(bitcoin-cli getblockchaininfo | jq -r '.verificationprogress')
  echo "BTC Node Progress: $(bc <<< "$BTC_SYNC * 100")%"
  
  # 3. Future Node Placeholders (ETH/ASA)
  echo "ETH Execution Client: [STAGING]"
  echo "ASA (Algorand) Node: [STAGING]"
  
  # 4. Global Disk Health
  df -h | grep -E '^/dev/sd|^/dev/nvme'
} >> "$LOG"
