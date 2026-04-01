#!/bin/bash

# To Show All Users (User List)

# Open the LightDM configuration file with: 
sudo nvim /etc/lightdm/lightdm.conf (or a text editor like vim, gedit).

# Find the [Seat:*] section.

# Add or uncomment the line: greeter-hide-users=false.

# Save the file and restart LightDM (or reboot) for changes to take effect. 
