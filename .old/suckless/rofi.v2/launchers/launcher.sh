#!/usr/bin/env bash

dir="$HOME/.dotfiles/suckless/.config/suckless/rofi/launchers"
theme='styleHorizontal'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
