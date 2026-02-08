import os

log_path = '/home/nodeadmin/Blockchain-Node-Ops/engineering_log.txt'
html_path = '/home/nodeadmin/Blockchain-Node-Ops/index.html'

with open(log_path, 'r') as f:
    lines = f.readlines()[-30:] # Get last 30 entries

html_content = f"""
<html>
<head><title>Nodeadmin Dash - teachtrade.uk</title>
<style>body {{ font-family: monospace; background: #1a1a1a; color: #00ff00; padding: 20px; }}
.log-entry {{ border-left: 3px solid #00ff00; padding-left: 10px; margin-bottom: 10px; }}</style>
</head>
<body>
<h1>Blockchain Node Ops Dashboard</h1>
<p>Maintainer: MSc, CITP, MBCS, CBP C4</p>
<div id="logs">
{''.join([f'<div class="log-entry">{line}</div>' for line in lines])}
</div>
</body>
</html>
"""

with open(html_path, 'w') as f:
    f.write(html_content)
