sudo apt install -y dwm suckless-tools build-essential libxinerama-dev libx11-dev libxft-dev git hsetroot rofi dunst picom

echo "Compile DWM ---------------------------------------------------------------"

tools=("dwm" "slstatus" "dmenu")
for tool in ${tools[@]}; do
  cd ~/.dotfiles/suckless/.config/suckless/$tool
  make
  sudo make clean install
  echo ">>>-------------------------------------------------------------------->"
done

# echo "install xmenu"
#
# cd ~/Downloads/
#
# echo "install xmenu"
# sudo apt install -y libimlib2-dev
# git clone https://github.com/phillbush/xmenu
# cd xmenu/
# sudo make clean install

cd ~


echo "lembretes"
echo "patch -p1 < patches/pakage-name"
echo "sudo rm config.h"
echo "sudo make clean install"





# polkit
# /usr/lib/lxpolkit &
# /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
# dunst -config ~/.config/suckless/dunst/dunstrc &
# hsetroot -cover ~/.dotfiles/pictures/plasma1366x768.png &
# ~/.config/bspwm/scripts/polybar-bspwm &
# picom --config ~/.config/suckless/picom/picom.conf --animations -b &
# exec dbus-run-session bspwm
