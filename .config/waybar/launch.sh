#!/usr/bin/env bash
STATE_FILE="$HOME/.config/waybar/.layout-state"
layout=$(cat "$STATE_FILE" 2>/dev/null || echo "vertical")

if [ "$layout" = "horizontal" ]; then
    waybar -c "$HOME/.config/waybar/config-horizontal.jsonc" -s "$HOME/.config/waybar/style-horizontal.css" &
else
    waybar -c "$HOME/.config/waybar/config.jsonc" -s "$HOME/.config/waybar/style.css" &
fi
