#!/bin/bash

sudo xbps-install -Syyu void-repo-multilib void-repo-nonfree void-repo-multilib-nonfree

sudo xbps-install -Syyu git make gcc libX11-devel  libgcc-32bit libdrm-32bit libglvnd-32bit libstdc++-32bit libXft-devel libXinerama-devel zsh zathura-pdf-mupdf xtools xrandr xprop xclip xcalc unzip transmission-gtk tar terminus-font shotwell scrot rofi qalculate picom pavucontrol pamixer pango obs numlockx noto-fonts-emoji nitrogen neovim neofetch mpv mlocate lxappearance lm_sensors libxcvt libxcb leafpad go font-inconsolata-otf flatpak feh expat dejavu-fonts-ttf dbus curl cargo alsa-tools alsa-utils alsa-plugins-pulseaudio alacritty 