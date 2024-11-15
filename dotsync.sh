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
	".config/cwt"
	".config/dunst"
	".config/rofi"
)

# Back up function (single file or directory)
backup_file() {
	local file="$1"
	local dest_dir="./$(dirname "$file")"  
	local dest_path="./$file" 

	# Check if file or directory exists in the home directory
	if [ -e "$HOME/$file" ]; then
		mkdir -p "$dest_dir"
		
		# If it's a file, compare before copying
		if [ -f "$HOME/$file" ]; then
			if [ ! -e "$dest_path" ] || ! cmp -s "$HOME/$file" "$dest_path"; then
				echo "Updating file $file"
				cp --preserve=mode,timestamps "$HOME/$file" "$dest_dir"
			else
				echo "File $file is up to date, skipping."
			fi
		# If it's a directory, use rsync to handle differences
		elif [ -d "$HOME/$file" ]; then
			echo "Syncing directory $file"
			rsync -av "$HOME/$file" "./$(dirname $file)/"
		else
			echo "Skipping $file (unsupported file type)."
		fi
	else
		echo "Error: $file not found in home directory. Skipping."
	fi
}

# Main script logic
echo "Starting backup of configuration files.."
for file in "${CONFIG_FILES[@]}"; do
	backup_file "$file"
done

echo "Backup completed."

