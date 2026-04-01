#!/bin/bash

echo "Stow ---------------------------------------------------------------"

# sudo apt install -y eza stow starship
sudo apt install -y eza stow

rm ~/.bashrc

cd ~/.dotfiles

echo "-------"

stow home
stow config

cd ~

