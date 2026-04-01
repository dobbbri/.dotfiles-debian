#!/bin/bash

cd $HOME/Downloads/

echo "gitHub desktop -----------------------------------------------------------"

sudo mkdir -p /etc/apt/keyrings && wget -qO - https://mirror.mwt.me/shiftkey-desktop/gpgkey | gpg --dearmor | sudo tee /etc/apt/keyrings/mwt-desktop.gpg > /dev/null

# To setup the package repository, run:
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/mwt-desktop.gpg] https://mirror.mwt.me/shiftkey-desktop/deb/ any main" | sudo tee /etc/apt/sources.list.d/mwt-desktop.list

# Then install GitHub Desktop:
sudo apt update && sudo apt install github-desktop

# wget https://github.com/shiftkey/desktop/releases/download/release-3.4.13-linux1/GitHubDesktop-linux-amd64-3.4.13-linux1.deb
#
# sudo dpkg -i GitHubDesktop-linux-amd64-3.4.13-linux1.deb

cd $HOME
