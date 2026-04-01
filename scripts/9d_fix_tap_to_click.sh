#!/bin/bash

echo "run script manually one by one ------------------------------"
exit 

fix_toucpad_tap_to_click() {

  # open 40-libinput.conf
  sudo nvim /usr/share/X11/xorg.conf.d/40-libinput.conf

  # #replace the section that contains "libinput touchpad catchall"
  # # by this code 
  Section "InputClass"
           Identifier "libinput touchpad catchall"
           MatchIsTouchpad "on"
           MatchDevicePath "/dev/input/event*"
           Driver "libinput"
           Option "Tapping" "on"
           Option "NaturalScrolling" "true"
  EndSection
}
