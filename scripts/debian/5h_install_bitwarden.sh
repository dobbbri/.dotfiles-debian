#!/bin/bash

cd ~/Downloads/

echo "bitwarden -----------------------------------------------------------"
wget https://github.com/bitwarden/clients/releases/download/desktop-v2025.12.0/Bitwarden-2025.12.0-amd64.deb

sudo dpkg -i Bitwarden-2025.12.0-amd64.deb

echo "execute"
echo "bitwarden --no-sandbox"

cd ~
