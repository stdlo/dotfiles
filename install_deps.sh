#!/bin/bash

# Initial update 
sudo pacman -Syu --noconfirm


# Pacman installs
sudo pacman -S --noconfirm git net-tools adobe-source-sans-pro-fonts acpi python2 python3 go i3-gaps i3blocks feh neovim yaourt htop wget ttf-hack tmux atom dunst cmake freetype2 fontconfig pkg-config make xclip xorg-xbacklight network-manager-applet rofi

# Yaourt installs
yaourt --noconfirm google-chrome ttf-mplus ttf-font-awesome-4


# git installs
mkdir -p ~/.local/bin
## i3blocks-contrib
git -C ~/.local/bin clone git@github.com:vivien/i3blocks-contrib.git
## alacritty
#git -C /tmp clone https://aur.archlinux.org/alacritty-git.git
#cd /tmp/alacritty-git
#makepkg -isr --noconfirm
# Link all files here

#set xresources
xrdb ~/.Xresources


# install npm stuff
sudo npm install depcheck prettier -g

