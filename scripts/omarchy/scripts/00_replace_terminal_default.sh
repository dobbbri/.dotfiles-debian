#!/bin/bash

omarchy-install-terminal alacritty
sudo pacman -Rns ghostty
sudo brightnessctl --device='intel_backlight' set 2200
