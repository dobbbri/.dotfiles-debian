#!/bin/bash

echo "install libs"
sudo apt install xorg xorg-dev dbus-x11 xinput hsetroot dialog gvfs psmisc fuse3 libnotify-bin xdotool unzip xinit xdotool curl unzip ssh-askpass wget stow build-essential cmake meson ninja-build wget pkg-config || echo "Warning: Package installation failed."

# echo "Installing apps..."
# sudo apt install alacritty thunar thunar-archive-plugin thunar-volman lxappearance feh \
#   fonts-recommended fonts-font-awesome fonts-terminus eza flameshot qimgv firefox-esr \
#   mousepad gparted htop color-picker mintstick atril transmission xarchiver ssh-askpass \
#   breeze-gtk-theme breeze-icon-theme breeze-cursor-theme galternatives lxtask fzf inkscape \
#   viewnior gimp papirus-icon-theme pamixer seahorse || echo "Warning: Package installation failed."
#
# # Configure/Install PipeWire (Recommended)
# sudo apt install pipewire pipewire-alsa pipewire-pulse pipewire-jack
# # libspa-0.2-bluetooth
# systemctl --user restart wireplumber pipewire pipewire-pulse

echo "Apps installation completed."
