#!/bin/bash

echo "- Install Neovim from image ---------------------------------------------"
sudo rm /usr/local/bin/nvim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

echo "- Install Neovim - languages --------------------------------------------"
sudo apt install --yes python3 python3-pip python3.13-venv golang rustc cargo ripgrep lua5.1 luarocks
#pip
pip install neovim vim-vint --break-system-packages
# create a new symlink
sudo ln -s /usr/bin/python3 /usr/bin/python

echo "- Install NPM packages --------------------------------------------------"
npm i -g neovim tree-sitter-cli
npm i -g typescript typescript-language-server

echo "- fix neovim clipboard -------------------------------------------------"
sudo apt install --yes xsel xclip

echo "- remove vim-tin and ---------------------------------------------------"
sudo apt --purge --yes autoremove vim-tiny vim
