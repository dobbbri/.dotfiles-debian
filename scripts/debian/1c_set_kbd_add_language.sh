#!/bin/bash

xdg-user-dirs-update

echo "- Set keyboard Idiome ---------------------------------------------------"
sudo dpkg-reconfigure keyboard-configuration

echo "- select us intl with dead keys -----------------------------------------"
sudo service keyboard-setup restart

echo "- Set Locales -----------------------------------------------------------"
sudo apt install --yes locales-all

echo "- select en_US.UTF-8 UTF-8 and and pt_BR.UTF-8 UTF-8 -------------------"
sudo dpkg-reconfigure locales
sudo sed -i /usr/share/X11/locale/en_US.UTF-8/Compose -e 's/ć/ç/g' -e 's/Ć/Ç/g'
