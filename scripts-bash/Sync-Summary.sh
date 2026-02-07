#!/bin/bash
# High-speed log parser for BTC Sync Progress
tail -f /mnt/bitcoin/debug.log | awk -F' ' '/UpdateTip/ {
    split($0, a, " ");
    for(i=1; i<=NF; i++) {
        if(a[i] ~ /height=/) h=a[i];
        if(a[i] ~ /date=/) d=a[i];
        if(a[i] ~ /progress=/) p=a[i];
    }
    printf "\r\033[K\033[1;32mSync Progress:\033[0m %s | \033[1;34mHeight:\033[0m %s | \033[1;33mBlock Date:\033[0m %s", p, h, d
}'
