#!/bin/bash
echo "fix brightness ------------------------------------------------------"
sudo apt install brightnessctl -yy

sudo brightnessctl --device='smc::kbd_backlight' set 30
sudo brightnessctl --device='acpi_video0' set 2

