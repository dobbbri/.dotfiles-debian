#!/bin/bash

# Using sudoers with NOPASSWD (Recommended) 
# You can allow your specific user to run this exact command without a password prompt by modifying the sudoers file. 

# Open the sudoers editor: 
sudo visudo

# Add the following line at the very end of the file, replacing yourusername with your actual Debian username:
sd ALL = (ALL) NOPASSWD: /sbin/ifdown wlp2s0b1
sd ALL = (ALL) NOPASSWD: /sbin/ifup wlp2s0b1

# To execute: You must still use the sudo prefix, but it will not ask for a password:
# sudo ifdown wlp2s0b1 
# sudo ifup wlp2s0b1 
