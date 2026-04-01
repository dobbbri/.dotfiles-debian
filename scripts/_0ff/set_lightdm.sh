#!/bin/sh

if [[ ! -d /usr/share/xsessions ]]; then
  sudo mkdir /usr/share/xsessions
fi

sudo mv /usr/share/xsessions/dwm.desktop /usr/share/xsessions/dwm.desktop.bkp
sudo echo '[greeter]
[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession' >>dwm.desktop
sudo mv dw.desktop /usr/share/xsessions/dwm.desktop

sudo mv /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.bkp
sudo echo '# General configuration
  [LightDM]
  [Seat:*]
  greeter-hide-users=false
  allow-user-switching=true
  [XDMCPServer]
  [VNCServer]' >>lightdm.conf
sudo mv lightdm.conf /etc/lightdm/lightdm.conf

sudo mv /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf.bkp
sudo echo '[greeter]
  theme-name = Yaru-dark
  icon-theme-name = Yaru-dark
  font-name = Quicksand Medium, Medium 10' >>lightdm-gtk-greeter.conf
sudo mv lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
