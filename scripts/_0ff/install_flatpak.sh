# install flatPack flathub
sudo apt install flatpak

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# restart

#install flatpak
flatpak install flathub com.bitwarden.desktop
flatpak install flathub io.github.shiftey.Desktop
flatpak install flathub io.github.mimbrero.WhatsAppDesktop

# flatpak run [progeam id]
flatpak run io.github.mimbrero.WhatsAppDesktop

# flatpak uninstall --delete-data [program id]
flatpak uninstall --delete-data com.github.vikdevelop.photopea_ap

# list all
flatpak list

# remove unused
flatpak uninstall --unused
