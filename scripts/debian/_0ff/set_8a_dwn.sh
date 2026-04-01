#!/bin/bash

# https://dwm.suckless.org/

#install libs
sudo apt install gcc make libxft-dev libxinerama-dev libxcb1-dev libx11-dev libnotify-dev -yy

echo "Compile DWM ---------------------------------------------------------------"

tools=("dwm" "st" "slstatus" "dmenu" "slock" "surf")
for tool in ${tools[@]}; do
  cd ~/.dotfiles/suckless/.config/suckless/$tool
  make
  sudo make clean install
  echo ">>>-------------------------------------------------------------------->"
done
