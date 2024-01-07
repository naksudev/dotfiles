import json
import subprocess
import random

# Lire le fichier JSON
with open('/home/nak/.config/hypr/assets/greeting_list.json') as f:
    data = json.load(f)

# Sélectionner aléatoirement un enregistrement
random_data = random.choice(data)

# Extraire les données sélectionnées
name = random_data['name']
avatar = "/home/nak/.config/hypr/assets/greeting_sprites/" + random_data['avatar']
message = random_data['message']

# Exécuter la commande bash
subprocess.run(["notify-send", name, message, "-i", avatar])


