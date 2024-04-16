import json
import subprocess
import random

# Read JSON data
with open('/home/naksu/.config/hypr/assets/greeting_list.json') as f:
    data = json.load(f)

# Pick a random index
random_data = random.choice(data)

# Save the random index into vars
name = random_data['name']
avatar = "/home/naksu/.config/hypr/assets/greeting_sprites/" + random_data['avatar']
message = random_data['message']

# Send notification
subprocess.run(["notify-send", name, message, "-i", avatar])

