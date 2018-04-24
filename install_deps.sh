#!/bin/bash

# Initial update 
sudo pacman -Syu --noconfirm

# Pacman installs
sudo pacman -S --noconfirm --needed git net-tools adobe-source-sans-pro-fonts acpi python2 python3 go i3-gaps i3blocks feh neovim yaourt htop wget ttf-hack tmux atom dunst cmake freetype2 fontconfig pkg-config make xclip xorg-xbacklight network-manager-applet rofi numix-gtk-theme

# Yaourt installs
yaourt -S --noconfirm --needed google-chrome ttf-iosevka cherry-font ttf-font-awesome-4

#set xresources
#xrdb ~/.Xresources


# install npm stuff
sudo npm install depcheck prettier -g

