#!/bin/bash
# Simple Watchdog: Checks if bitcoind is running
if ! pgrep -x "bitcoind" > /dev/null
then
    echo "[$(date)] ALERT: bitcoind is not running! Attempting restart..." >> ~/node_events.log
    # Uncomment the line below once your start script is ready
    # bitcoind -daemon
else
    echo "[$(date)] Node is healthy."
fi
