import subprocess
import time

def get_progress():
    res = subprocess.check_output(['bitcoin-cli', 'getblockchaininfo'])
    import json
    data = json.loads(res)
    return data['verificationprogress'], data['blocks']

p1, b1 = get_progress()
time.sleep(10) # Wait 10 seconds to measure velocity
p2, b2 = get_progress()

velocity = (p2 - p1) / 10 # Progress per second
remaining = (1.0 - p2) / velocity if velocity > 0 else 0

print(f"Current Progress: {p2*100:.2f}%")
print(f"Sync Velocity: {velocity*3600*100:.4f}% per hour")
print(f"Estimated Time Remaining: {remaining/3600:.2f} hours")
