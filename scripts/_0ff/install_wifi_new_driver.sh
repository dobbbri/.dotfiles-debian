#!/bin/sh

# fix macbook wireless speed
echo "- Update and Upgrade and update Wifi ------------------------------------"
sudo apt install network-manager
sudo apt update
sudo apt remove broadcom-sta-dkms && sudo apt install broadcom-sta-dkms
sudo apt upgrade

echo " reboot now"
