#!/bin/bash

# to make execurable
# chmod +x install_nodejs.sh 

echo "- Install NPM packages --------------------------------------------------"
npm i -g @ast-grep/cli npm-check-updates 

# echo "- Fix NPM access --------------------------------------------------------"
# mkdir ~/.npm-global
# npm config set prefix "$HOME/.npm-global"
# export PATH="$HOME/.npm-global/bin:$PATH"

