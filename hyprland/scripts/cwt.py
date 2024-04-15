import os
import subprocess
import argparse
import time
import random

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
    print("- random (NOT AVAILABLE YET)")

def set_wallpaper(theme):
    set_current_theme(theme)

    # Path of the wallpaper theme
    theme_path = os.path.join(BASE_DIR, theme)

    if not os.path.exists(theme_path):
        print(f"The '{theme}' theme doesn't exist.")
        return 1

    # List of wallpapers
    image_files = [os.path.join(theme_path, file) for file in os.listdir(theme_path) if os.path.isfile(os.path.join(theme_path, file))]

    if not image_files:
        print(f"No wallpapers was found for {theme} theme'.")
        return 1

    # Apply a random wallpaper 
    chosen_image = random.choice(image_files)
    subprocess.run(["/usr/bin/swww", "img", chosen_image, "--transition-fps=60"])

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
    elif args.command == 'next':
        set_wallpaper(get_current_theme())
    else:
        # At startup of Hyprland
        while True:
            set_wallpaper(get_current_theme())
            time.sleep(300)

