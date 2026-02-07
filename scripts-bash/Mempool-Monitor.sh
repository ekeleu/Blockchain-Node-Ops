#!/bin/bash
# Check local mempool status
echo "--- Local Mempool Status ---"
bitcoin-cli getmempoolinfo | jq -r '
  "Transactions: " + (.size | toString) + 
  "\nData Size: " + (.bytes / 1024 / 1024 | format("%.2f")) + " MB" +
  "\nMin Fee: " + (.mempoolminfee | toString) + " BTC/kvB"'
