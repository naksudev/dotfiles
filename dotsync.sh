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
	".config/dunst"
	".config/rofi"
)

# Back up function (single file or directory)
backup_file() {
	local source="$HOME/$1"
	local destination="./$file"

	if [ -e "$source" ]; then
		echo "Syncing $source."
		rsync -a --delete "$source" "$(dirname "$destination")/"
	else
		echo "$1 file or folder no longer exists in the source. Deleting it in destination."
		rm -rf "$destination"
	fi
}

# Main script logic
echo "Starting backup of configuration files.."
for file in "${CONFIG_FILES[@]}"; do
	backup_file "$file"
done

echo "Backup completed."
