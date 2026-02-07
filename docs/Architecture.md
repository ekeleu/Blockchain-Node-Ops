# Storage Tiering & Node Architecture

## Hardware Configuration
| Drive | Capacity | Filesystem | Role | Connection |
| :--- | :--- | :--- | :--- | :--- |
| **sdc** | 256GB | Ext4 | Ubuntu 22.04 LTS (Native) | USB 2.0 |
| **sde** | 1.0TB | NTFS | Bitcoin Core Mainnet | USB 3.0 |
| **sdd** | 1.9TB | Ext4 | Cardano & Ethereum Ledgers | NVMe (USB 3.1) |

## Performance Tuning
- **Bitcoin `dbcache`:** 16,000 MiB (Optimized for 32GB RAM).
- **Parallel Threads (`par`):** 6 (Leaves 2 logical threads for OS/Management).
- **Mount Strategy:** UUID-based persistent mounting via `/etc/fstab` with `nofail` flags.

## Recovery Notes
- Successfully recovered 1.9TB NVMe after failed OS installation. 
- Maintained ledger integrity for `cardano_data` and `eth_data`.
