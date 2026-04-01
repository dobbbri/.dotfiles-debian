#!/bin/sh

echo "Add lightdm -----------------------------------------------------------------"
if [[ ! -d /$HOME/.local/share/dwm ]]; then
  mkdir /usr/share/xsessions/
fi

sudo apt install lightdm

# sudo mv /usr/share/xsessions/dwm.desktop /usr/share/xsessions/dwm.desktop.bkp
# sudo cp $HOME/.dotfiles/scripts/.config/scripts/config/dwm.desktop /usr/share/xsessions/dwm.desktop
sudo mv /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.bkp
sudo cp $HOME/.dotfiles/scripts/.config/scripts/config/lightdm.conf /etc/lightdm/lightdm.conf
sudo mv /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf.bkp
sudo cp $HOME/.dotfiles/scripts/.config/scripts/config/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
