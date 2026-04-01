#!/bin/shc

ln -s $HOME/dotfiles/config/neofetch/ $HOME/.config/neofetch

echo "Replace .ssh ------------------------------------------------------------"
rm -rf $HOME/.ssh
ln -s $HOME/dotfiles/ssh/ $HOME/.ssh
chmod 400 $HOME/.ssh/id_ed25519

echo "Replace bash ------------------------------------------------------------"
rm $HOME/.bashrc
ln -s $HOME/dotfiles/bashrc $HOME/.bashrc
rm $HOME/.aliases
ln -s $HOME/dotfiles/aliases $HOME/.aliases

echo "Replace .config/bunsen --------------------------------------------------"
rm -rf $HOME/.config/bunsen
ln -s $HOME/dotfiles/config/bunsen/ $HOME/.config/bunsen

echo "Replace .config/xfce4 ---------------------------------------------------"
rm -rf $HOME/.config/xfce4
ln -s $HOME/dotfiles/config/xfce4/ $HOME/.config/xfce4

echo "Replace .config/geany ---------------------------------------------------"
rm -rf $HOME/.config/geany
ln -s $HOME/dotfiles/config/geany/ $HOME/.config/geany

echo "Replace .config/Thunar ---------------------------------------------------"
rm -rf $HOME/.config/Thunar
ln -s $HOME/dotfiles/config/Thunar/ $HOME/.config/Thunar

echo "Replace .config/openbox -------------------------------------------------"
rm -rf $HOME/.config/openbox
ln -s $HOME/dotfiles/config/openbox/ $HOME/.config/openbox

# echo "Replace .config/onedrive -------------------------------------------------"
# rm -rf $HOME/.config/onedrive
# ln -s $HOME/dotfiles/config/onedrive $HOME/.config/onedrive

echo "Replace .config/jgmenu -------------------------------------------------"
rm -rf $HOME/.config/jgmenu
ln -s $HOME/dotfiles/config/jgmenu $HOME/.config/jgmenu

echo "Add shortcus ------------------------------------------------------------"
rm $HOME/.config/tint2/tint2rc
ln -s $HOME/dotfiles/config/tint2/tint2rc $HOME/.config/tint2/tint2rc
rm $HOME/.xbindkeysrc
ln -s $HOME/dotfiles/xbindkeysrc $HOME/.xbindkeysrc

ln -s $HOME/dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/gitattributes $HOME/.gitattributes
ln -s $HOME/dotfiles/wget-hsts $HOME/.wget-hsts
ln -s $HOME/dotfiles/config/gammastep $HOME/.config/gammastep

ln -s $HOME/dotfiles/config/astro $HOME/.config/astro
ln -s $HOME/dotfiles/config/NvChad-2.5 $HOME/.config/nvim
ln -s $HOME/dotfiles/config/wezterm $HOME/.config/wezterm
ln -s $HOME/dotfiles/config/alacritty $HOME/.config/alacritty
ln -s $HOME/dotfiles/config/kitty $HOME/.config/kitty

echo "Add walpapers ------------------------------------------------------------"
sudo cp $HOME/dotfiles/images/Tintin.jpg /usr/share/images/bunsen/wallpapers/default/Tintin.jpg
sudo cp $HOME/dotfiles/images/SD-logo-no-shadow.png /usr/share/images/bunsen/wallpapers/default/SD-logo-no-shadow.png

sudo cp $HOME/dotfiles/images/nice-blue-background.png /usr/share/images/bunsen/wallpapers/default
sudo cp $HOME/dotfiles/images/nice-blue-background.png /usr/share/images/bunsen/grub/default
sudo cp $HOME/dotfiles/images/nice-blue-background.png /usr/share/images/bunsen/login/default

sudo cp $HOME/dotfiles/images/tron.jpeg /usr/share/images/bunsen/wallpapers/default
sudo cp $HOME/dotfiles/images/tron.jpeg /usr/share/images/bunsen/grub/default
sudo cp $HOME/dotfiles/images/tron.jpeg /usr/share/images/bunsen/login/default

# sudo cp $HOME/dotfiles/images/black.jpg /usr/share/images/bunsen/wallpapers/default
# sudo cp $HOME/dotfiles/images/black.jpg /usr/share/images/bunsen/grub/default
# sudo cp $HOME/dotfiles/images/black.jpg /usr/share/images/bunsen/login/default

echo "THE END"
