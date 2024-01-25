import os
import subprocess
import time
import argparse

WALLPAPER_PATH_NSFW = "/home/naksu/Pictures/Wallpapers/Nier/NSFW"
WALLPAPER_PATH_SFW = "/home/naksu/Pictures/Wallpapers/Nier/SFW"

MODE_FILE = "/tmp/swww_mode"  

def read_mode():
    try:
        with open(MODE_FILE, 'r') as file:
            return file.read().strip()
    except FileNotFoundError:
        return "SFW"  

def write_mode(mode):
    with open(MODE_FILE, 'w') as file:
        file.write(mode)

def toggle_nsfw_mode():
    current_mode = read_mode()
    
    # Set new mode
    new_mode = "NSFW" if current_mode == "SFW" else "SFW"
    write_mode(new_mode)
    change_wallpaper()

def change_wallpaper():
    current_mode = read_mode()

    # Set wallpaper path of current theme
    wallpaper_path = WALLPAPER_PATH_NSFW if current_mode == "NSFW" else WALLPAPER_PATH_SFW

    # Retrieves all wallpapers
    image_files = [os.path.join(wallpaper_path, file) for file in os.listdir(wallpaper_path) if os.path.isfile(os.path.join(wallpaper_path, file))]

    # Apply a random wallpaper
    if image_files:
        chosen_image = image_files[int(time.time()) % len(image_files)]
        subprocess.run(["/usr/bin/swww", "img", chosen_image])
    else:
        print("No images found in the directory.")
        exit(1)

if __name__ == "__main__":
    # Arguments Parser
    parser = argparse.ArgumentParser(description='Wallpaper switching script')
    parser.add_argument('-toggle-nsfw', action='store_true', help='Toggle between NSFW mode')

    args = parser.parse_args()

    if args.toggle_nsfw:
        toggle_nsfw_mode()
    else:
        interval = 300
        while True:
            change_wallpaper()
            time.sleep(interval)

