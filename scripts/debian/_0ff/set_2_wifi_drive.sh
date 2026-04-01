#!/bin/bash

echo "New wifi driver ---------------------------------------------------------------"
sudo apt update
sudo apt install network-manager
sudo apt remove broadcom-sta-dkms && sudo apt install broadcom-sta-dkms
sudo apt upgrade
sudo systemctl reboot
