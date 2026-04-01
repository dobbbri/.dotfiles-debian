#!/bin/bash

# Adding Contrib and Non-Free Repositories
sudo add-apt-repository contrib
sudo add-apt-repository non-free
sudo apt update
sudo apt install vim sudo git
git clone https://github.com/dobbbri/.dotfiles.git

echo "edit sudoers ---------------------------------------------------------"
vi /etc/sudoers
# add:
# sergio ALL=(ALL:ALL) ALL

# exit from root
exit
git clone https://github.com/dobbbri/.dotfiles.git
# exit from my login
exit
# login

# https://wiki.debian.org/brcm80211

sudo apt install broadcom-sta-dkms linux-headers-$(uname -r)
sudo apt update && apt install firmware-brcm80211

# With BCM4313-based devices, brcmsmac driver information may be displayed even after system boot.
# You can ignore/hide this by adding a "dmesg -n 3" line to your /etc/rc.local file.

sudo vim /etc/rc.local
# add:
dmesg -n 3
