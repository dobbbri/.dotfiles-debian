#!/bin/bash

cd $HOME/Downloads/

echo "obsidian -------------------------------------------------------------------"
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.10.6/obsidian_1.10.6_amd64.deb

sudo dpkg -i obsidian_1.10.6_amd64.deb

cd $HOME

