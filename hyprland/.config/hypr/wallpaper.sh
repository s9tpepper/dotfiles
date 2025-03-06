#!/usr/bin/env zsh

WALLPAPER_DIR="/mnt/nas/documents/desktop wallpapers/zelda/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Apply the selected wallpaper
hyprctl -i $(ls /run/user/1000/hypr) hyprpaper reload ,"$WALLPAPER"
