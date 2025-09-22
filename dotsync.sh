#!/bin/bash

set -euo pipefail

CONFIG_FILES=(
	".zshrc"
	".zshenv"
	".config/nvim"
	".config/hypr"
	".config/waybar"
	".config/user-dirs.conf"
	".config/user-dirs.dirs"
	".config/user-dirs.locale"
	".config/kitty"
	".config/swaync"
	".config/rofi"
	".config/fastfetch"
)

# Back up function (single file or directory)
backup_file() {
	local source="$HOME/$1"
	local destination="./$file"

	if [ -e "$source" ]; then
		echo "Syncing $source"
		rsync -a --delete "$source" "$(dirname "$destination")/"
	else
		echo "$1 file or folder no longer exists in the source. Deleting it in destination."
		rm -rf "$destination"
	fi
}

# Main script logic
echo -e "\033[1;31mStarting backup of configuration files..\033[0m"
for file in "${CONFIG_FILES[@]}"; do
	backup_file "$file"
done

echo -e "\033[1;32mBackup completed."
