#!/bin/bash

dwm_keybindings_file="$HOME/.config/suckless/dwm/keybindings.txt"

# Read DWM keybindings (first section)
dwm_bindings=$(awk -F'\t' '
    { printf "%-1s|%-1s\n", $1, $2 }
' "$dwm_keybindings_file")

# Format for rofi display
formatted_keybindings=$(echo "$dwm_bindings" | column -t -s '|')

# Show combined list in rofi
selected=$(echo "$formatted_keybindings" | rofi -dmenu -normal-window -i -p "Keybindings" -line-padding 4 -hide-scrollbar -theme ~/.config/suckless/rofi/helper/keybinds.rasi)

