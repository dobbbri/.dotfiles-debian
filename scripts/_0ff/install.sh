#!/bin/bash

# JustAGuy Linux - DWM Setup
# https://codeberg.org/justaguylinux/dwm-setup

set -e

# Paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config/suckless"
TEMP_DIR="/tmp/dwm_$$"
LOG_FILE="$HOME/dwm-install.log"

# Logging and cleanup
exec > >(tee -a "$LOG_FILE") 2>&1
trap "rm -rf $TEMP_DIR" EXIT

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

die() {
  echo -e "${RED}ERROR: $*${NC}" >&2
  exit 1
}
msg() { echo -e "${CYAN}$*${NC}"; }

# Banner
clear
read -p "Install DWM? (y/n) " -n 1 -r
echo
[[ ! $REPLY =~ ^[Yy]$ ]] && exit 1

# Update system
msg "Updating system..."
sudo apt-get update && sudo apt-get upgrade -y

# Package groups for better organization
PACKAGES_CORE=(
  xorg xorg-dev brightnessctl xbindkeys xvkbd xinput
  build-essential sxhkd xdotool dbus-x11 hsetroot
  libnotify-bin libnotify-dev libusb-0.1-4
)

PACKAGES_UI=(
  rofi dunst feh lxappearance network-manager alacritty
  dialog firefox-esr qimgv geany lxtask gparted
  color-picker mintstick atril transmission papirus-icon-theme adwaita-icon-theme-legacy galculator mpv gimp
)

PACKAGES_FILE_MANAGER=(
  thunar thunar-archive-plugin thunar-volman
  gvfs-backends dialog mtools smbclient cifs-utils unzip
)

PACKAGES_AUDIO=(
  alsa-utils
)

PACKAGES_UTILITIES=(
  acpi acpid flameshot qimgv xdg-user-dirs-gtk fd-find 
  eza fzf heif-gdk-pixbuf webp-pixbuf-loader
)

PACKAGES_TERMINAL=(
  suckless-tools stow ssh-askpass xarchiver
)

PACKAGES_FONTS=(
  fonts-recommended fonts-font-awesome fonts-terminus
)

PACKAGES_BUILD=(
  cmake meson ninja-build curl wget pkg-config
)

# Install packages by group
msg "Installing core packages..."
sudo apt-get install -y "${PACKAGES_CORE[@]}" || die "Failed to install core packages"

msg "Installing UI components..."
sudo apt-get install -y "${PACKAGES_UI[@]}" || die "Failed to install UI packages"

msg "Installing file manager..."
sudo apt-get install -y "${PACKAGES_FILE_MANAGER[@]}" || die "Failed to install file manager"

msg "Installing audio support..."
sudo apt-get install -y "${PACKAGES_AUDIO[@]}" || die "Failed to install audio packages"

msg "Installing system utilities..."
sudo apt-get install -y "${PACKAGES_UTILITIES[@]}" || die "Failed to install utilities"

msg "Installing terminal tools..."
sudo apt-get install -y "${PACKAGES_TERMINAL[@]}" || die "Failed to install terminal tools"

msg "Installing fonts..."
sudo apt-get install -y "${PACKAGES_FONTS[@]}" || die "Failed to install fonts"

msg "Installing build dependencies..."
sudo apt-get install -y "${PACKAGES_BUILD[@]}" || die "Failed to install build tools"

# Enable services
sudo systemctl enable acpid

# Handle existing config
if [ -d "$CONFIG_DIR" ]; then
  clear
  read -p "Found existing suckless config. Backup? (y/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    mv "$CONFIG_DIR" "$CONFIG_DIR.bak.$(date +%s)"
    msg "Backed up existing config"
  else
    clear
    read -p "Overwrite without backup? (y/n) " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]] || die "Installation cancelled"
    rm -rf "$CONFIG_DIR"
  fi
fi

# Copy configs
msg "Setting up configuration..."
mkdir -p "$CONFIG_DIR"
cp -r "$SCRIPT_DIR"/suckless/* "$CONFIG_DIR"/ || die "Failed to copy configs"

# Build suckless tools
msg "Building suckless tools..."
for tool in dwm slstatus st; do
  cd "$CONFIG_DIR/$tool" || die "Cannot find $tool"
  make && sudo make clean install || die "Failed to build $tool"
done

# Create desktop entry for DWM
sudo mkdir -p /usr/share/xsessions
cat <<EOF | sudo tee /usr/share/xsessions/dwm.desktop >/dev/null
[Desktop Entry]
Name=dwm
Comment=Dynamic window manager
Exec=dwm
Type=XSession
EOF

# Setup directories
xdg-user-dirs-update
mkdir -p ~/Screenshots

# Install essential components
mkdir -p "$TEMP_DIR" && cd "$TEMP_DIR"

msg "Installing fonts..."
# Font version and directories
FONT_VERSION="v3.4.0"
FONTS_DIR="$HOME/.local/share/fonts"
TEMP_DIR="/tmp/nerdfonts_install_$$" # Using PID to avoid conflicts

# Create necessary directories
mkdir -p "$FONTS_DIR"
mkdir -p "$TEMP_DIR"

# Clean up the temporary directory
rm -rf "$TEMP_DIR"

# Done
echo -e "\n${GREEN}Installation complete!${NC}"
echo "1. Log out and select 'dwm' from your display manager"
echo "2. Press Super+H for keybindings"
