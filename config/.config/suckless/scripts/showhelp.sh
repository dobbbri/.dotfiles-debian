#!/bin/bash

dwm_keybindings_file="$HOME/.config/suckless/dwm/keybindings.txt"
sxhkdrc_file="$HOME/.config/suckless/sxhkd/sxhkdrc"

# Read DWM keybindings (first section)
dwm_bindings=$(awk -F'\t' '
    { printf "%-22s|%s\n", $1, $2 }
' "$dwm_keybindings_file")

# Format for rofi display
formatted_keybindings=$(echo "$dwm_bindings" | column -t -s '|')

# Show combined list in rofi
selected=$(echo "$formatted_keybindings" | rofi -dmenu -i -p "Keybindings" -l 18 -line-padding 1 -hide-scrollbar -theme ~/.config/suckless/rofi/keybinds.rasi)

# Check if user selected something
if [ -n "$selected" ]; then
    # Determine if it's from SXHKD (and executable)
    source=$(echo "$selected" | awk '{print $1}')
    if [[ "$source" == "SXHKD" ]]; then
        command=$(echo "$selected" | awk -F'|' '{print $3}' | xargs)
        if [ -n "$command" ]; then
            nohup $command &>/dev/null &
        fi
    fi
fi
