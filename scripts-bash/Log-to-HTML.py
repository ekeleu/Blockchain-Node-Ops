import subprocess

def get_status_color(lines):
    for line in lines[-5:]:
        if "[!]" in line or "critical" in line.lower(): return "#ff0000"
    return "#00ff41"

log_path = '/home/nodeadmin/Blockchain-Node-Ops/engineering_log.txt'
html_path = '/home/nodeadmin/Blockchain-Node-Ops/index.html'

with open(log_path, 'r') as f:
    lines = f.readlines()

status_color = get_status_color(lines)
display_lines = lines[-15:]

html_content = f"""
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {{ background: #050505; color: #00ff41; font-family: 'Courier New', monospace; margin: 0; padding: 15px; }}
        .header {{ border-bottom: 2px solid #333; padding-bottom: 10px; }}
        h1 {{ font-size: 1.4rem; margin: 10px 0; }}
        .indicator {{ height: 12px; width: 12px; background: {status_color}; border-radius: 50%; display: inline-block; box-shadow: 0 0 8px {status_color}; }}
        .log-container {{ background: #000; padding: 10px; border-radius: 5px; margin-top: 20px; font-size: 0.85rem; overflow-x: auto; }}
        .creds {{ color: #00d4ff; font-size: 0.8rem; }}
        @media (max-width: 600px) {{ h1 {{ font-size: 1.1rem; }} .log-container {{ font-size: 0.75rem; }} }}
    </style>
</head>
<body>
    <div class="header">
        <h1><div class="indicator"></div> teachtrade.uk Node Status</h1>
        <div class="creds">MSc | CITP | MBCS | CBP C4</div>
    </div>
    <div class="log-container">
        {'<br>'.join([l.strip() for l in display_lines])}
    </div>
</body>
</html>
"""
with open(html_path, 'w') as f: f.write(html_content)
