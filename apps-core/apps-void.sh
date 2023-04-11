#!/bin/bash

sudo xbps-install -Syu
#sudo xbps-install -S void-repo-multilib void-repo-nonfree void-repo-multilib-nonfree
sudo xbps-install -Syu

sudo xbps-install -Syu libX11 libXft pkg-config
sudo xbps-install -Syu git make gcc                      
sudo xbps-install -Syu dmenu
sudo xbps-install -Syu sxhkd
sudo xbps-install -Syu dwm
sudo xbps-install -Syu polkit     
sudo xbps-install -Syu ntfs-3g 
sudo xbps-install -Syu xfce-polkit
sudo xbps-install -Syu ConsoleKit2
sudo xbps-install -Syu elogind
sudo xbps-install -Syu udisks2
sudo xbps-install -Syu cgmanager 
sudo xbps-install -Syu libgcc-32bit libdrm-32bit
sudo xbps-install -Syu libX11-devel
sudo xbps-install -Syu libglvnd-32bit
sudo xbps-install -Syu libstdc++-32bit
sudo xbps-install -Syu libXft-devel
sudo xbps-install -Syu libXinerama-devel
sudo xbps-install -Syu zsh zathura-pdf-mupdf
sudo xbps-install -Syu xtools xrandr xprop
sudo xbps-install -Syu xclip xcalc unzip
sudo xbps-install -Syu transmission-gtk tar
sudo xbps-install -Syu terminus-font
sudo xbps-install -Syu shotwell
sudo xbps-install -Syu scrot rofi
sudo xbps-install -Syu qalculate
sudo xbps-install -Syu picom
sudo xbps-install -Syu pavucontrol
sudo xbps-install -Syu pamixer
sudo xbps-install -Syu pango
sudo xbps-install -Syu numlockx
sudo xbps-install -Syu noto-fonts-emoji
sudo xbps-install -Syu nitrogen
sudo xbps-install -Syu neofetch
sudo xbps-install -Syu mpv mlocate
sudo xbps-install -Syu lxappearance 
sudo xbps-install -Syu lm_sensors
sudo xbps-install -Syu libxcvt libxcb
sudo xbps-install -Syu leafpad go
sudo xbps-install -Syu font-inconsolata-otf
sudo xbps-install -Syu flatpak
sudo xbps-install -Syu firefox feh expat
sudo xbps-install -Syu kdeconnect-22.12.1_2
sudo xbps-install -Syu dunst dejavu-fonts-ttf dbus
sudo xbps-install -Syu curl cargo btop wget
sudo xbps-install -Syu alsa-tools alsa-utils
sudo xbps-install -Syu alsa-plugins-pulseaudio
sudo xbps-install -Syu alacritty 
sudo xbps-install -Syu albert
sudo xbps-install -Syu kid3 
sudo xbps-install -Syu pipewire
sudo xbps-install -Syu xmirror
sudo xbps-install -Syu ufw
sudo xbps-install -Syu dropbox
sudo xbps-install -Syu tumbler-4.18.0_1
sudo xbps-install -Syu Thunar-4.18.4_1 
sudo xbps-install -Syu xfce4-notifyd-0.6.4_1
sudo xbps-install -Syu thunderbird
sudo xbps-install -Syu ristretto
sudo xbps-install -Syu xdg-user-dirs-0.18_1
sudo xbps-install -Syu mtools-4.0.42_1 
sudo xbps-install -Syu xfce4-power-manager-dbg-4.18.1_1
sudo xbps-install -Syu evince-44.0_1
sudo xbps-install -Syu sublime-text4-4143_1
sudo xbps-install -Syu gnome-disk-utility-44.0_1
sudo xbps-install -Syu cmatrix
sudo xbps-install -Syu python3-requests-2.28.2_1 
sudo xbps-install -Syu chromium-111.0.5563.64_1
sudo xbps-install -Syu qt5ct
sudo xbps-install -Syu kvantum-1.0.5_1  
sudo xbps-install -Syu qbittorrent-4.5.2_1
sudo xbps-install -Syu lolcat-c-1.4_1
sudo xbps-install -Syu guvcview
sudo xbps-install -Syu kdenlive
sudo xbps-install -Syu obs



sudo xbps-install -Syu xorg xorg-server xorg-apps 
#sudo xbps-install -S lightdm lightdm-gtk-greeter
#sudo xbps-install -S sddm


###################



sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/cgmanager /var/service/
sudo ln -s /etc/sv/consolekit /var/service/
sudo ln -s /etc/sv/polkitd /var/service/
#sudo ln -s /etc/sv/lightdm /var/service/
#sudo ln -s /etc/sv/sddm /var/service/
sudo ln -s /etc/sv/pipewire /var/service/
sudo ln -s /etc/sv/pipewire-pulse /var/service/
sudo ln -s /etc/sv/ufw /var/service/
#sudo ln -s /etc/sv/dhcpcd /var/service
#sudo ln -s /etc/sv/dhcpcd-eth0 /var/service
#sudo ln -s /etc/sv/wpa_supplicant /var/service

