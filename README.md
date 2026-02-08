# ₿ Multi-Node Infrastructure & Security (BTC/ETH/ASA)

Forensic-level deployment of blockchain infrastructure, managed by an **MSc Systems Engineer** and **CBP (C4)**.

## Engineering Highlight: Tiered Storage Migration
- **Problem:** I/O contention and storage saturation on 1TB SSD when running concurrent nodes.
- **Solution:** Implemented a Hot/Cold tiering model.
  - **Hot Tier (SSD):** Chainstate/UTXO databases for high-speed lookups.
  - **Cold Tier (NVMe Warehouse):** 700GB+ of historical block data via symbolic links.
- **Outcome:** Reclaimed 70% SSD capacity for Ethereum staging without degrading Bitcoin validation throughput.

*Live logs and infrastructure updates tracked via this repository.*
