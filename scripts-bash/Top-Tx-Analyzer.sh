#!/bin/bash
# Analyze last 1,000 blocks for the largest transactions
END_HEIGHT=$(bitcoin-cli getblockcount)
START_HEIGHT=$((END_HEIGHT - 1000))

echo "Analyzing blocks $START_HEIGHT to $END_HEIGHT..."

# Get all TXIDs from the range, then get their sizes, sort, and take top 5
for h in $(seq $START_HEIGHT $END_HEIGHT); do
    bitcoin-cli getblock $(bitcoin-cli getblockhash $h) 1 | jq -r '.tx[]'
done | xargs -I {} bitcoin-cli getrawtransaction {} 1 | jq -r '.size, .txid' | \
paste - - | sort -nr | head -n 5 | \
awk '{printf "Size: %.2f MB | TXID: %s\n", $1/1048576, $2}'
