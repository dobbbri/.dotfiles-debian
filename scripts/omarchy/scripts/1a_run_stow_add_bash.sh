#!/bin/bash

echo "Stow ---------------------------------------------------------------"

# sudo apt install -y eza stow starship
sudo pacman -Sy stow firefox bitwarden


cd ~/.dotfiles
mv ~/.config/nvim ~/.config/lazyvim
echo "-------"

stow astro
stow vimbtw

cd ~

