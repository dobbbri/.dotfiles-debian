#!/bin/bash
if [[ ! -d /$HOME/.local/share/fonts ]]; then
  mkdir ~/.local/share/fonts
fi


cd /tmp
fonts=(
  "UbuntuSans"
  "JetBrainsMono"
  "Meslo"
)

for font in ${fonts[@]}; do
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/$font.zip
  unzip $font.zip -d ~/.local/share/fonts/$font/
  rm $font.zip
done

fc-cache -f
