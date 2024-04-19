import os
import subprocess
import argparse
import time
import random
import psutil

BASE_DIR = os.path.expanduser("/home/naksu/.wallpapers")
CURRENT_THEME = "/tmp/current_theme"

def get_current_theme():
    try:
        with open(CURRENT_THEME, 'r') as file:
            return file.read().strip()
    except FileNotFoundError:
        set_current_theme("nier") 

def set_current_theme(mode):
    with open(CURRENT_THEME, 'w') as file:
        file.write(mode)

def list_themes():
    print("Available themes:")
    for theme in os.listdir(BASE_DIR):
        themes = os.path.join(BASE_DIR, theme)
        num_files = len([file for file in os.listdir(themes) if os.path.isfile(os.path.join(themes, file))])
        print(f"- {theme} [{num_files}]")
    print("- random")

def set_wallpaper(theme):
    set_current_theme(theme)

    # Path of the wallpaper theme
    theme_path = os.path.join(BASE_DIR, theme)

    # List of all the wallpapers of the theme
    image_files = [os.path.join(theme_path, file) for file in os.listdir(theme_path) if os.path.isfile(os.path.join(theme_path, file))]

    # Check if the theme exists
    if not os.path.exists(theme_path):
        print(f"The '{theme}' theme doesn't exist.")
        print("Setting nier theme by default.")
        set_wallpaper("nier")

    # Check if there's any wallpaper of the theme
    if not image_files:
        print(f"No wallpapers was found for {theme} theme.")
        print("Setting nier theme by default.")
        set_wallpaper("nier")

    # Apply a random wallpaper 
    subprocess.run(["/usr/bin/swww", "img", random.choice(image_files), "--transition-fps=60"])

def update_waybar(theme):
    # Kill current waybar process
    for proc in psutil.process_iter():
        if proc.name() == "waybar":
            proc.kill()

    # Invoke a new waybar process
    subprocess.Popen(["waybar", "-c", "/home/naksu/.config/waybar/config.jsonc", "-s", f"/home/naksu/.config/waybar/styles/{theme}.css", "-l", "off"])

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Change Wallpaper Theme - Made with ♥ by naksudev')
    subparsers = parser.add_subparsers(dest='command', title='Available commands')

    parser_list = subparsers.add_parser('list', help='List available wallpaper themes')
    parser_next = subparsers.add_parser('next', help='Next wallpaper')
    parser_set = subparsers.add_parser('set', help='Set a wallpaper theme')
    parser_set.add_argument('theme', help='Theme name')

    args = parser.parse_args()

    if args.command == 'list':
        list_themes()
    elif args.command == 'set':
        set_wallpaper(args.theme)
        #update_waybar(args.theme)
    elif args.command == 'next':
        set_wallpaper(get_current_theme())
    else:
        # At startup of Hyprland
        while True:
            set_wallpaper(get_current_theme())
            time.sleep(300)

