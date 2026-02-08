#!/bin/bash
# High-speed analyzer for the last 100 blocks
EH=$(bitcoin-cli getblockcount)
SH=$((EH - 100))

echo "Analyzing blocks $SH to $EH for Mega-Transactions..."

for h in $(seq $SH $EH); do
    # Get block data and sort txs by size in one go
    bitcoin-cli getblock $(bitcoin-cli getblockhash $h) 2 | jq -r '.tx[] | [.size, .txid] | @tsv'
done | sort -rn | head -n 5 | awk '{printf "Size: %.2f MB | TXID: %s\n", $1/1048576, $2}'
