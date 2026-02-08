#!/bin/bash
# Ultra-fast analyzer using blockstats
EH=$(bitcoin-cli getblockcount)
SH=$((EH - 100))

echo "Analyzing blocks $SH to $EH for Max Transaction Sizes..."

for h in $(seq $SH $EH); do
    # Get max_tx_size and height in one lightweight call
    bitcoin-cli getblockstats $h '["max_tx_size","height"]' | jq -r '[.height, .max_tx_size] | @tsv'
done | sort -k2 -rn | head -n 5 | awk '{printf "Block: %s | Max TX Size: %.2f MB\n", $1, $2/1048576}'
