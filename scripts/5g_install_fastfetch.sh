#!/bin/bash

cd $HOME/Downloads/

echo "fastfetch -------------------------------------------------------------------"
wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.49.0/fastfetch-linux-amd64.deb
sudo dpkg -i fastfetch-linux-amd64.deb

cd $HOME
