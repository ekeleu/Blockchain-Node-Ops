# 🗺️ Multi-Node Storage Architecture

| Disk | Mount | Role | Nodes Hosted |
| :--- | :--- | :--- | :--- |
| **SSD (1TB)** | `/mnt/bitcoin` | **Hot Tier** (State/UTXO) | BTC `chainstate`, ETH `state`, ASA `ledger` |
| **HDD (2TB)** | `/mnt/warehouse`| **Cold Tier** (Ancient/Blocks) | BTC `blocks`, ETH `ancient`, ASA `archive` |

### I/O Management
To avoid NVMe saturation, all "Ancient" or historical block data is symlinked or directed to the Warehouse drive using specific client flags.
