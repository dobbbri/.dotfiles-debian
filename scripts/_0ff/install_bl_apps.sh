#!/bin/sh

echo "- Set keyboard Idiome ---------------------------------------------------"
sudo dpkg-reconfigure keyboard-configuration

echo "- select us intl with dead keys -----------------------------------------"
sudo service keyboard-setup restart

echo "- Set Locales -----------------------------------------------------------"
sudo apt install --yes locales-all

echo "- select en_US.UTF-8 UTF-8 and and pt_BR.UTF-8 UTF-8 -------------------"
sudo dpkg-reconfigure locales
sudo sed -i /usr/share/X11/locale/en_US.UTF-8/Compose -e 's/ć/ç/g' -e 's/Ć/Ç/g'

echo "- install packages ------------------------------------------------------"
# sudo apt install --yes nodejs npm gammastep curl ssh-askpass onedrive wget color-picker mintstick ttf-mscorefonts-installer tumbler tumbler-plugins-extra ffmpegthumbnailer
sudo apt install --yes git curl ssh-askpass wget color-picker mintstick
sudo apt install --yes ffmpegthumbnailer qalculate-gtk atril

echo "- fix neovim clipboard -------------------------------------------------"
sudo apt install --yes xsel xclip

echo "- Optimize Linux Laptop Battery Life and thermal changes ----------------"
sudo apt install --yes tlp tlp-rdw linux-cpupower acpi-support acpi-call-dkms thermald
sudo tlp start

echo "- remove vim-tin and install vim ----------------------------------------"
sudo apt --purge autoremove modemmanager vim-tiny
sudo apt install --yes vim

echo "- Remove printer services -----------------------------------------------"
sudo apt --purge autoremove cups system-config-printer simple-scan

echo "- Remove bluetooth services ---------------------------------------------"
sudo systemctl disable bluetooth.service

echo "- Install Neovim from image ---------------------------------------------"
sudo rm /usr/local/bin/nvim
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

echo "- Install Neovim - languages --------------------------------------------"
sudo apt install --yes python3 python3-pip golang rustc cargo ripgrep lua5.1 luarocks
pip install neovim vim-vint --break-system-packages
# create a new symlink
sudo ln -s /usr/bin/python3 /usr/bin/python


echo "- disable wifi messages -------------------------------------------------"
gsettings set org.gnome.nm-applet disable-disconnected-notifications "true"
gsettings set org.gnome.nm-applet disable-connected-notifications "true"

echo "- Enable/Fix tap to click -----------------------------------------------"
sudo apt remove --yes xserver-xorg-input-synaptics
sudo apt install --yes xserver-xorg-input-libinput
# sudo nvim /etc/X11/xorg.conf.d/40-libinput.conf
echo 'Section "InputClass"
         Identifier "libinput touchpad catchall"
         MatchIsTouchpad "on"
         MatchDevicePath "/dev/input/event*"
         Driver "libinput"
         Option "Tapping" "on"
         Option "NaturalScrolling" "true"
EndSection' >>40-libinput.conf

sudo mv 40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf

echo "- Link for Download .deb apps -------------------------------------------"
echo "- to install use:   sudo dpkg -i <pakage_name>

echo "https://obsidian.md/download"
sudo rm /usr/local/bin/obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.7.6/Obsidian-1.7.6.AppImage
chmod u+x Obsidian-1.7.6.AppImage
sudo mv Obsidian-1.7.6.AppImage /usr/local/bin/obsidian

echo "https://bitwarden.com/download/"
sudo rm /usr/local/bin/bitwarden
# open https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=appimage&_gl=1*1ifpyjm*_gcl_au*MjA3MDYxMzQwMi4xNzMxNTQwMzY5
chmod u+x ~/Downloads/Bitwarden-2024.11.0-x86_64.AppImage
sudo mv ~/Download/Bitwarden-2024.11.0-x86_64.AppImage /usr/local/bin/bitwarden

echo "https://github.com/shiftkey/desktop/releases/"
sudo rm /usr/local/bin/github-desktop
wget https://github.com/shiftkey/desktop/releases/download/release-3.4.8-linux1/GitHubDesktop-linux-x86_64-3.4.8-linux1.AppImage
chmod u+x GitHubDesktop-linux-x86_64-3.4.8-linux1.AppImage
sudo mv GitHubDesktop-linux-x86_64-3.4.8-linux1.AppImage /usr/local/bin/github-desktop



echo "https://github.com/minbrowser/min/releases/download/v1.32.1/min-1.32.1-amd64.deb"
echo "ttps://github.com/davidsmorais/kuro/releases" #ms todo
# echo "https://responsively.app/download"
# echo "https://wezfurlong.org/wezterm/install/linux.html#pre-built-deb-packages"
echo "   "
#echo "- Link for Download icons -----------------------------------------------"
#wget "https://github.com/zayronxio/Mkos-Big-Sur/releases/download/0.3/Mkos-Big-Sur.tar.xz"
echo "   "
#echo "- Link for Download theme -----------------------------------------------"
#wget "https://github.com/vinceliuice/WhiteSur-gtk-theme/blob/master/release/WhiteSur-Dark.tar.xz"
echo "   "
# cp BunsenLabsDotfiles/Arc-Dark-OSX.tar.gz Arc-Dark-OSX.tar.gz

# Install Nerd fonts
# Download or install the nerd fonts with the nerd fonts installer script. To install nerd fonts, run the following script.
# echo "- Install nerd font -----------------------------------------------------"
# source ~/BunsenLabsDotfiles/scripts/install_nerdfonts.sh

echo "THE END"
