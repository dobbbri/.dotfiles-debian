#!/bin/bash

# vi  /etc/apt/sources.list 
# add "contrib non-free"
rm /etc/apt/sources.list
cp /home/sdobri/.dotfiles/scripts/.config/scripts/config/sources.list /etc/apt/sources.list
apt update


