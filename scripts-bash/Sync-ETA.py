import subprocess
import json
import time

def get_data():
    raw = subprocess.check_output(['bitcoin-cli', 'getblockchaininfo'])
    return json.loads(raw)

# Measure velocity over 15 seconds for better accuracy in the Ordinals era
d1 = get_data()
time.sleep(15)
d2 = get_data()

prog1, block1 = d1['verificationprogress'], d1['blocks']
prog2, block2 = d2['verificationprogress'], d2['blocks']

velocity = (prog2 - prog1) / 15 
remaining_prog = 1.0 - prog2

if velocity > 0:
    hours_left = (remaining_prog / velocity) / 3600
    print(f"Sync Velocity: {velocity*3600*100:.4f}% per hour")
    print(f"Projected Completion: {hours_left:.2f} hours from now")
else:
    print("Sync Velocity: Static (Waiting for I/O or new blocks)")
