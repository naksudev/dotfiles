#!/usr/bin/env bash

CONFIG_DIR="$HOME/.config/waybar"
STATE_FILE="$CONFIG_DIR/.layout-state"
HYPR_VARS_CONF="$HOME/.config/hypr/src/vars.lua"
LOCKFILE="/tmp/waybar-toggle.lock"

# Prevent overlapping runs if clicked rapidly
if [ -e "$LOCKFILE" ]; then
    exit 0
fi

touch "$LOCKFILE"
trap 'rm -f "$LOCKFILE"' EXIT

current=$(cat "$STATE_FILE" 2>/dev/null || echo "vertical")

if [ "$current" = "vertical" ]; then
    new="horizontal"
    config_file="config-horizontal.jsonc"
    style_file="style-horizontal.css"
    slide_dir="slide"
else
    new="vertical"
    config_file="config.jsonc"
    style_file="style.css"
    slide_dir="slidevert"
fi

echo "$new" > "$STATE_FILE"

# Update Hyprland workspace slide direction to match orientation
sed -i -E "s/(leaf = 'workspaces'[^}]*style = ')(slide|slidevert)(')/\1$slide_dir\3/" "$HYPR_VARS_CONF"
sed -i -E "s/(direction = ')(vertical|horizontal)(')/\1$new\3/" "$HYPR_VARS_CONF"
hyprctl reload

# Kill existing waybar and wait for it to fully die before relaunching
pkill -SIGTERM waybar
while pgrep -x waybar >/dev/null; do
    sleep 0.05
done

waybar -c "$CONFIG_DIR/$config_file" -s "$CONFIG_DIR/$style_file" >/dev/null 2>&1 &
disown
