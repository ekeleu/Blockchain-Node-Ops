#!/bin/bash
# Monitor for the 50% Sync Milestone
TARGET=0.500000
LOG="/mnt/bitcoin/debug.log"

echo "Waiting for 50% milestone... (Current Era: Late 2021)"

tail -f $LOG | awk -F' ' -v target="$TARGET" '/UpdateTip/ {
    for(i=1; i<=NF; i++) {
        if($i ~ /progress=/) {
            p=substr($i, 10);
            if (p >= target) {
                print "\n\n\033[1;32m[!!!] MILESTONE REACHED: 50% OF BLOCKCHAIN VALIDATED [!!!]\033[0m";
                print "\033[1;34mEra: Nov 2021 (Taproot Activation / All-Time High)\033[0m\n";
                system("sleep 2");
                exit;
            }
            printf "\rCurrent Progress: %s / %s", p, target
        }
    }
}'
