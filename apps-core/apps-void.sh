#!/bin/bash

sudo xbps-install -Su
sudo xbps-install -S void-repo-multilib void-repo-nonfree void-repo-multilib-nonfree
sudo xbps-install -Su

sudo xbps-install -S git make gcc                      
sudo xbps-install -S dmenu
sudo xbps-install -S sxhkd
sudo xbps-install -S dwm
sudo xbps-install -S polkit     
sudo xbps-install -S ntfs-3g 
sudo xbps-install -S xfce-polkit
sudo xbps-install -S ConsoleKit2
sudo xbps-install -S elogind
sudo xbps-install -S udisks2
sudo xbps-install -S cgmanager 
sudo xbps-install -S libgcc-32bit libdrm-32bit
sudo xbps-install -S libX11-devel
sudo xbps-install -S libglvnd-32bit
sudo xbps-install -S libstdc++-32bit
sudo xbps-install -S libXft-devel
sudo xbps-install -S libXinerama-devel
sudo xbps-install -S zsh zathura-pdf-mupdf
sudo xbps-install -S xtools xrandr xprop
sudo xbps-install -S xclip xcalc unzip
sudo xbps-install -S transmission-gtk tar
sudo xbps-install -S terminus-font
sudo xbps-install -S shotwell
sudo xbps-install -S scrot rofi
sudo xbps-install -S qalculate
sudo xbps-install -S picom
sudo xbps-install -S pavucontrol
sudo xbps-install -S pamixer
sudo xbps-install -S pango
sudo xbps-install -S numlockx
sudo xbps-install -S noto-fonts-emoji
sudo xbps-install -S nitrogen
sudo xbps-install -S neofetch
sudo xbps-install -S mpv mlocate
sudo xbps-install -S lxappearance 
sudo xbps-install -S lm_sensors
sudo xbps-install -S libxcvt libxcb
sudo xbps-install -S leafpad go
sudo xbps-install -S font-inconsolata-otf
sudo xbps-install -S flatpak
sudo xbps-install -S firefox feh expat
sudo xbps-install -S dunst dejavu-fonts-ttf dbus
sudo xbps-install -S curl cargo btop wget
sudo xbps-install -S alsa-tools alsa-utils
sudo xbps-install -S alsa-plugins-pulseaudio
sudo xbps-install -S alacritty 
sudo xbps-install -S albert
sudo xbps-install -S kid3 


sudo xbps-install -S xorg-server xorg-apps 
sudo xbps-install -S lightdm lightdm-gtk-greeter



###################



sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/cgmanager /var/service/
sudo ln -s /etc/sv/consolekit /var/service/
sudo ln -s /etc/sv/polkitd /var/service/
sudo ln -s /etc/sv/lightdm lightdm-gtk-greeter /var/service/