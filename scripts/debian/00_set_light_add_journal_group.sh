#!/bin/bash

sudo apt install -y brightnessctl

# set keybord backlight
sudo brightnessctl --device='smc::kbd_backlight' set 30
# set video brightness
sudo brightnessctl --device='acpi_video0' set 2

# add your user journal group
sudo usermod -a -G adm $(whoami)
sudo usermod -a -G systemd-journal $(whoami)

# Add your user to the fuse group
sudo usermod -aG fuse $(whoami)
