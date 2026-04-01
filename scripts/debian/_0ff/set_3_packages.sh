#!/bin/sh

# sudo mintstick -m format
# sudo mintstick -m iso

# brightnessctl --list
sudo brightnessctl --device='smc::kbd_backlight' set 30
sudo brightnessctl --device='acpi_video0' set 2

# chmod 400 ~/.ssh/id_ed25519

# sudo dpkg -i <pakage_name>
# https://obsidian.md/download
# https://bitwarden.com/download/
# https://github.com/shiftkey/desktop/release

# install packages
# sudo apt install xorg xserver-xorg sakura -yy
# sudo apt install firefox-esr geany pcmanfm alacritty -yy
sudo apt install gparted neofetch htop alsa-utils ristretto exa color-picker mintstick atril transmission feh -yy
sudo apt install xarchiver curl dunst unzip ssh-askpass wget dconf-editor stow -yy
sudo apt install fonts-noto-color-emoji lxappearance lxtask fzf yaru-theme-gtk yaru-theme-icon -yy

echo "- Optimize Linux Laptop Battery Life and thermal changes ----------------"
sudo apt install --yes tlp tlp-rdw acpi-support acpi-call-dkms thermald
sudo tlp start

echo "- Enable/Fix tap to click -----------------------------------------------"
sudo apt remove --yes xserver-xorg-input-synaptics
sudo apt install --yes xserver-xorg-input-libinput
sudo cp $HOME/.dotfiles/scripts/.config/scripts/config/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf

echo "- remove modemmanager --------------------------------------------------"
sudo apt --purge --yes autoremove modemmanager

echo "- Remove printer services -----------------------------------------------"
sudo apt --purge --yes autoremove cups system-config-printer simple-scan

echo "- Remove bluetooth services ---------------------------------------------"
sudo apt --purge --yes autoremove blueman bluez-utils bluez bluetooth
