#!/bin/sh

# to make execurable
# chmod +x createKeygen.sh

# Generating a new SSH key
ssh-keygen -t ed25519 -C "sergiodobri@gmail.com"

# Start the ssh-agent in the background.
eval "$(ssh-agent -s)"

# Add your SSH private key to the ssh-agent.
ssh-add -K ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub >~/.ssh/authorized_keys

# add github.com to know hosts
ssh-keyscan github.com >>~/.ssh/known_hosts

# create config and add content
touch ~/.ssh/config
echo 'Host *
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_ed25519' >>~/.ssh/config

# Test an SSH connection
ssh -T git@github.com

# verify if exist
ls -al ~/.ssh

# Copy the SSH public key to your clipboard.
cat ~/.ssh/id_ed25519.pub

# page https://github.com/settings/ssh/new and paste your ssh public key
echo "https://github.com/settings/ssh/new"

# fix 644 permission
chmod 400 ~/.ssh/id_ed25519
