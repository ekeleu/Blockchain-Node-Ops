#!/bin/bash
# Global Health Monitor: BTC (Active), ETH & ASA (Staging)
LOG="/home/nodeadmin/Blockchain-Node-Ops/engineering_log.txt"

{
  echo "--- GLOBAL AUDIT: $(date '+%Y-%m-%d %H:%M') ---"
  # BTC Status
  BINFO=$(bitcoin-cli getblockchaininfo)
  echo "BTC_SYNC: $(echo $BINFO | jq -r '.verificationprogress * 100 | .[0:5]')%"
  
  # Thermal Check (Critical for High-Density Sync)
  TEMP=$(sensors | grep "Package id 0" | awk '{print $4}' | sed 's/+//')
  echo "THERMAL_CPU: $TEMP"
  
  # ETH/ASA Staging placeholders
  echo "ETH_STATUS: STAGING (Post-Merge Specs Required)"
  echo "ASA_STATUS: STAGING (Participation Node Prep)"
} >> "$LOG"
