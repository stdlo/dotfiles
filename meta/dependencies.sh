#!/bin/bash

# Initial update
sudo pacman -Syu --noconfirm

# pacman installs
sudo pacman -S --noconfirm --needed \
	git \
	net-tools \
	acpi \
	python2 \
	python3 \
	go \
	i3-gaps \
	i3blocks \
	feh \
	neovim \
	yaourt \
	htop \
	wget \
	tmux \
	atom \
	dunst \
	cmake \
	make \
	freetype2 \
	fontconfig \
	ttf-hack \
	pkg-config \
	xclip \
	xorg-xbacklight \
	network-manager-applet \
	rofi \
	numix-gtk-theme

# yaourt installs
yaourt -S --noconfirm --needed \
	google-chrome \
	ttf-sarsa-gothic \
	ttf-font-awesome-4

# install npm stuff
sudo npm install depcheck prettier -g
