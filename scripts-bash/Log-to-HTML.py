import os, subprocess, json

def get_era(height):
    if height < 770000: return "Pre-Ordinals Era"
    if height < 800000: return "Ordinals Summer (2023)"
    if height < 825000: return "The Inscription Peak"
    if height < 840000: return "ETF Approval/Runes Prep"
    if height < 850000: return "Post-Halving (2024)"
    return "Modern Network Era (2025-2026)"

log_path = '/home/nodeadmin/Blockchain-Node-Ops/engineering_log.txt'
html_path = '/home/nodeadmin/Blockchain-Node-Ops/index.html'

# Fetch height from node
res = subprocess.check_output(['bitcoin-cli', 'getblockcount'])
height = int(res.decode().strip())
era = get_era(height)

with open(log_path, 'r') as f:
    lines = f.readlines()[-30:]

html_content = f"""
<html>
<head><title>Nodeadmin Dash - teachtrade.uk</title>
<style>
    body {{ font-family: 'Courier New', monospace; background: #0d0d0d; color: #00ff41; padding: 25px; }}
    .header {{ border-bottom: 2px solid #00ff41; margin-bottom: 20px; }}
    .era-badge {{ background: #00ff41; color: #000; padding: 5px 10px; font-weight: bold; border-radius: 5px; }}
    .log-entry {{ border-left: 1px solid #333; padding-left: 15px; margin: 5px 0; color: #aaffaa; }}
    .citp {{ color: #00d4ff; font-weight: bold; }}
</style>
</head>
<body>
<div class="header">
    <h1>LIVE BLOCKCHAIN AUDIT: BTC + ETH + ASA</h1>
    <p>Lead Engineer: <span class="citp">MSc, CITP, MBCS, CBP C4</span></p>
    <p>Current Network Era: <span class="era-badge">{era}</span> (Block {height})</p>
</div>
<div id="logs">
{''.join([f'<div class="log-entry">{line.strip()}</div>' for line in lines])}
</div>
</body>
</html>
"""
with open(html_path, 'w') as f:
    f.write(html_content)
