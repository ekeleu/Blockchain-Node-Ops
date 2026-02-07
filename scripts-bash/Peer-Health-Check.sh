#!/bin/bash
# Check connectivity and peer quality
echo "--- Peer Health Dashboard ---"
printf "%-20s %-12s %-10s %-10s\n" "Remote Address" "Type" "Ping (ms)" "Version"
echo "------------------------------------------------------------"

bitcoin-cli getpeerinfo | jq -r '.[] | 
  "\(.addr | .[0:20])\t\(.connection_type)\t\(.pingtime * 1000 | floor)ms\t\(.subver)"' | \
  column -t -s $'\t'
