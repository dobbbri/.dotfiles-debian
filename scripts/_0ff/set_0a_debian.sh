#!/bin/bash

echo "install sudo ---------------------------------------------------------"
#login with my user as password
# change to root (dont forget the minus)

su -

echo "clone dotfiles -------------------------------------------------------"
apt install vim sudo git 
git clone https://github.com/dobbbri/.dotfiles.git 

