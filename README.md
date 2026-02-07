# Blockchain Node Ops: Multi-Protocol Engineering & Security

Professional deployment of a sovereign "Triple-Node" stack (BTC, ADA, ETH) on specialized hardware. This repository documents the architecture, automation, and recovery procedures for high-availability blockchain infrastructure.

## 🛠 Hardware Architecture (Dell Precision / 4C 8T / 32GB RAM)
- **Primary OS:** Ubuntu 22.04 LTS (Native Dual-Boot for direct hardware I/O).
- **BTC Storage:** 1.0TB SSD (USB 3.0 / NTFS) - Core Node Sync in progress.
- **Protocol NVMe:** 1.9TB NVMe (USB 3.1 / Ext4) - Hosting Cardano and Ethereum ledgers.
- **Networking:** Latency-optimized p2p configuration via persistent SSH & tmux.

## 📁 Repository Structure
- **/scripts-bash/**: The "Observer Suite" for real-time telemetry (Mempool, Peer Health, Sync Summary).
- **/scripts-ps/**: Windows-side disk mounting automation for WSL2 interoperability.
- **/configs/**: Hardened `fstab` and `bitcoind` configuration templates.

## 📈 Recovery & Forensics Milestone
Successfully executed a manual partition recovery on the 1.9TB NVMe after a failed OS deployment, preserving the `cardano_data` and `eth_data` directories. Implemented UUID-based persistent mounting to prevent future boot-loop failures.

## 🚀 How to use
1. Run `./scripts-bash/Storage-Precheck.sh` to verify mount points.
2. Alias `syncstat` to monitor BTC block validation in real-time.
3. Utilize `tmux` sessions for persistent 24/7 uptime.

---
*Maintained by an Information Systems Engineer (MSc) & Certified Bitcoin Professional (CBP).*
