#!/bin/bash
sudo apt install unzip fontconfig

# ========================================
# Font Installation
# ========================================
# Installs a list of selected fonts for better terminal and GUI appearance
# ----------------------------------------------------------------------
# This section installs various fonts including `Nerd Fonts` from GitHub releases,
# and copies custom TTF fonts into the local fonts directory. It then rebuilds
# the font cache using `fc-cache`.
install_fonts() {
  echo "Installing fonts..."
  mkdir -p ~/.local/share/fonts
  fonts=("JetBrainsMono" "Lilex"  "UbuntuMono"  "UbuntuSans" "IntelOneMono" "NerdFontsSymbolsOnly" "CascadiaMono")

  for font in "${fonts[@]}"; do
    if [ -d ~/.local/share/fonts/$font ]; then
      echo "Font $font is already installed. Skipping."
    else
      echo "Installing font: $font"
      wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/$font.zip" -P /tmp || {
        echo "Warning: Error downloading font $font."
        continue
      }
      unzip -q /tmp/$font.zip -d ~/.local/share/fonts/$font/ || echo "Warning: Error extracting font $font."
      rm /tmp/$font.zip
    fi
  done

  fc-cache -f || echo "Warning: Error rebuilding font cache."
  echo "Font installation completed."
}

install_fonts

echo "All installations completed successfully!"
