#!/bin/bash
# Load environment for Bitcoin-CLI and Git
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
REPO_DIR="/home/nodeadmin/Blockchain-Node-Ops"

# 1. Run the health check
bash "$REPO_DIR/scripts-bash/Disk-Health-Check.sh"

# 2. Git Automation
cd "$REPO_DIR"
git add engineering_log.txt
git commit -m "chore: automated health check - $(date '+%Y-%m-%d %H:%M')"
git push origin main
echo "--- Sync Projection ---"
python3 /home/nodeadmin/Blockchain-Node-Ops/scripts-bash/Sync-ETA.py >> "$LOG_FILE"
