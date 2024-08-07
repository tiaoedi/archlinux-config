#!/bin/bash


##################################################################################################################
################################      LINUXLIVRE       ###########################################################
##################################################################################################################
############# youtube: https://www.youtube.com/channel/UC7mTcm79pzUu4a46X1ththw ##################################
############# github.com/tiaoedi                                                ##################################
############# GRUPO DISCORD: https://discord.gg/2CCAE9hBTT                      ##################################
############# SUPORTE PIX: tiaoedi@gmail.com                                    ##################################
##################################################################################################################


echo
tput setaf 2
echo "################################################################"
echo "################### Instalando apps por favor aguarde!!!"
echo "################################################################"
tput sgr0
echo

sudo pacman -Syyu --noconfirm --needed

sudo pacman -S yay --noconfirm --needed
sudo pacman -S paru --noconfirm --needed

sudo pacman -Syyu --noconfirm --needed

sudo pacman -S --noconfirm --needed xf86-video-intel
sudo pacman -S --noconfirm --needed  mesa-demos  
sudo pacman -S --noconfirm --needed  mesa-utils 
sudo pacman -S --noconfirm --needed  mesa-vdpau
sudo pacman -S --noconfirm --needed vulkan-extra-layers  
sudo pacman -S --noconfirm --needed vulkan-headers            
sudo pacman -S --noconfirm --needed vulkan-mesa-layers        
sudo pacman -S --noconfirm --needed vulkan-swrast            
sudo pacman -S --noconfirm --needed vulkan-validation-layers
sudo pacman -S --noconfirm --needed vulkan-html-docs          
sudo pacman -S --noconfirm --needed vulkan-intel              
sudo pacman -S --noconfirm --needed vulkan-radeon             
sudo pacman -S --noconfirm --needed pipewire-audio

#sudo pacman -S gdm --noconfirm --needed

sudo pacman -S sddm --noconfirm --needed
sudo pacman -S xorg-server xorg-apps --noconfirm --needed

#sudo pacman -S lightdm lightdm-gtk-greeter --noconfirm --needed


sudo pacman -S i3 --noconfirm --needed
 
 #cd
#git clone https://aur.archlinux.org/yay.git
 #cd yay/
#echo "Instalando yay por favor aguarde!!!"
 # makepkg -si --noconfirm --needed 

  #cd
#yay -Syyu --noconfirm --needed 

#git clone https://aur.archlinux.org/paru.git
 #cd paru/
#echo "Instalando paru por favor aguarde!!!!"
#makepkg -si --noconfirm --needed 

 #cd
#paru -Syyu --noconfirm --needed 

sudo pacman -Syyu --noconfirm --needed 
sudo pacman -S flatpak --noconfirm --needed 
sudo pacman -Syyu --noconfirm --needed 
#sudo pacman -S --noconfirm --needed ttf-wps-fonts
#sudo pacman -S --noconfirm --needed wps-office
#sudo pacman -S --noconfirm --needed wps-office-mime
sudo pacman -S --noconfirm --needed adobe-source-sans-fonts
sudo pacman -S --noconfirm --needed aic94xx-firmware
sudo pacman -S --noconfirm --needed noto-fonts-emoji
sudo pacman -S --noconfirm --needed alacritty
sudo pacman -S --noconfirm --needed alacritty-themes
sudo pacman -S --noconfirm --needed arandr
sudo pacman -S --noconfirm --needed arc-darkest-theme-git
sudo pacman -S --noconfirm --needed arc-gtk-theme
sudo pacman -S --noconfirm --needed archiso
sudo pacman -S --noconfirm --needed asciinema
sudo pacman -S --noconfirm --needed avahi
sudo pacman -S --noconfirm --needed awesome-terminal-fonts
sudo pacman -S --noconfirm --needed ayu-theme
sudo pacman -S --noconfirm --needed baobab
sudo pacman -S --noconfirm --needed base16-alacritty-git
sudo pacman -S --noconfirm --needed bash-completion
sudo pacman -S --noconfirm --needed bat
sudo pacman -S --noconfirm --needed bibata-cursor-theme-bin
sudo pacman -S --noconfirm --needed cpuid
sudo pacman -S --noconfirm --needed curl
sudo pacman -S --noconfirm --needed discord
sudo pacman -S --noconfirm --needed dmenu
sudo pacman -S --noconfirm --needed downgrade
if [ ! -f /usr/bin/duf ]; then
  sudo pacman -S --noconfirm --needed duf
fi
sudo pacman -S --noconfirm --needed evince
sudo pacman -S --noconfirm --needed expac
sudo pacman -S --noconfirm --needed feh
sudo pacman -S --noconfirm --needed file-roller
sudo pacman -S --noconfirm --needed firefox
sudo pacman -S --noconfirm --needed fish
sudo pacman -S --noconfirm --needed flameshot
sudo pacman -S --noconfirm --needed fluent-icon-theme-git
sudo pacman -S --noconfirm --needed font-manager
sudo pacman -S --noconfirm --needed galculator
sudo pacman -S --noconfirm --needed gimp
sudo pacman -S --noconfirm --needed git
sudo pacman -S --noconfirm --needed gitahead-bin
sudo pacman -S --noconfirm --needed gitfiend
sudo pacman -S --noconfirm --needed gnome-disk-utility
sudo pacman -S --noconfirm --needed gparted
sudo pacman -S --noconfirm --needed grub-customizer
sudo pacman -S --noconfirm --needed gtop
sudo pacman -S --noconfirm --needed gvfs-smb
sudo pacman -S --noconfirm --needed hardcode-fixer-git
sudo pacman -S --noconfirm --needed hardinfo-gtk3
sudo pacman -S --noconfirm --needed hddtemp
sudo pacman -S --noconfirm --needed htop
sudo pacman -S --noconfirm --needed hw-probe
sudo pacman -S --noconfirm --needed inkscape
sudo pacman -S --noconfirm --needed kvantum
sudo pacman -S --noconfirm --needed linux-firmware-qlogic
sudo pacman -S --noconfirm --needed logrotate
sudo pacman -S --noconfirm --needed lolcat
sudo pacman -S --noconfirm --needed lshw
sudo pacman -S --noconfirm --needed man-db
sudo pacman -S --noconfirm --needed man-pages
sudo pacman -S --noconfirm --needed mlocate
sudo pacman -S --noconfirm --needed meld
sudo pacman -S --noconfirm --needed mintstick-git
sudo pacman -S --noconfirm --needed most
sudo pacman -S --noconfirm --needed neofetch
sudo pacman -S --noconfirm --needed ufetch
sudo pacman -S --noconfirm --needed network-manager-applet
sudo pacman -S --noconfirm --needed networkmanager-openvpn
sudo pacman -S --noconfirm --needed nomacs
sudo pacman -S --noconfirm --needed noto-fonts
sudo pacman -S --noconfirm --needed ntp
sudo pacman -S --noconfirm --needed nss-mdns
sudo pacman -S --noconfirm --needed numlockx
sudo pacman -S --noconfirm --needed oh-my-zsh-git
sudo pacman -S --noconfirm --needed openresolv
sudo pacman -S --noconfirm --needed pavucontrol
sudo pacman -S --noconfirm --needed playerctl
sudo pacman -S --noconfirm --needed polkit-gnome
sudo pacman -S --noconfirm --needed python-pylint
sudo pacman -S --noconfirm --needed python-pywal
sudo pacman -S --noconfirm --needed pv
sudo pacman -S --noconfirm --needed vim
sudo pacman -S --noconfirm --needed qbittorrent
sudo pacman -S --noconfirm --needed rate-mirrors-bin
sudo pacman -S --noconfirm --needed ripgrep
sudo pacman -S --noconfirm --needed rsync
sudo pacman -S --noconfirm --needed scrot
sudo pacman -S --noconfirm --needed simplescreenrecorder
sudo pacman -S --noconfirm --needed sparklines-git
sudo pacman -S --noconfirm --needed speedtest-cli-git
sudo pacman -S --noconfirm --needed spotify
sudo pacman -S --noconfirm --needed spotify-adblock-git 
sudo pacman -S --noconfirm --needed squashfs-tools
sudo pacman -S --noconfirm --needed sublime-text-4
sudo pacman -S --noconfirm --needed surfn-icons-git
sudo pacman -S --noconfirm --needed system-config-printer
sudo pacman -S --noconfirm --needed telegram-desktop
sudo pacman -S --noconfirm --needed the_platinum_searcher-bin
sudo pacman -S --noconfirm --needed the_silver_searcher
sudo pacman -S --noconfirm --needed time
sudo pacman -S --noconfirm --needed tree
sudo pacman -S --noconfirm --needed ttf-bitstream-vera
sudo pacman -S --noconfirm --needed ttf-dejavu
sudo pacman -S --noconfirm --needed ttf-droid
sudo pacman -S --noconfirm --needed ttf-hack
sudo pacman -S --noconfirm --needed ttf-inconsolata
sudo pacman -S --noconfirm --needed ttf-liberation
sudo pacman -S --noconfirm --needed ttf-roboto
sudo pacman -S --noconfirm --needed ttf-roboto-mono
sudo pacman -S --noconfirm --needed ttf-ubuntu-font-family
sudo pacman -S --noconfirm --needed upd72020x-fw
sudo pacman -S --noconfirm --needed vlc
sudo pacman -S --noconfirm --needed wd719x-firmware
sudo pacman -S --noconfirm --needed wget
sudo pacman -S --noconfirm --needed wttr
sudo pacman -S --noconfirm --needed xcolor
sudo pacman -S --noconfirm --needed xdg-user-dirs
sudo pacman -S --noconfirm --needed xorg-xkill
sudo pacman -S --noconfirm --needed zsh
sudo pacman -S --noconfirm --needed zsh-completions
sudo pacman -S --noconfirm --needed zsh-syntax-highlighting
sudo systemctl enable avahi-daemon.service
sudo systemctl enable ntpd.service
#sudo systemctl enable gdm 
sudo systemctl enable sddm
#sudo systemctl enable lightdm.service

sudo pacman -S --noconfirm --needed pulseaudio-bluetooth
sudo pacman -S --noconfirm --needed bluez
sudo pacman -S --noconfirm --needed bluez-libs
sudo pacman -S --noconfirm --needed bluez-utils
sudo pacman -S --noconfirm --needed blueberry

sudo pacman -S --noconfirm --needed cups
sudo pacman -S --noconfirm --needed cups-pdf
sudo pacman -S --noconfirm --needed ghostscript
sudo pacman -S --noconfirm --needed gsfonts
sudo pacman -S --noconfirm --needed gutenprint
sudo pacman -S --noconfirm --needed gtk3-print-backends
sudo pacman -S --noconfirm --needed libcups
sudo pacman -S --noconfirm --needed system-config-printer
sudo pacman -S --noconfirm --needed sane
sudo pacman -S --noconfirm --needed simple-scan

sudo pacman -S --noconfirm --needed rxvt-unicode
sudo pacman -S --noconfirm --needed urxvt-fullscreen
sudo pacman -S --noconfirm --needed urxvt-perls
sudo pacman -S --noconfirm --needed urxvt-resize-font-git
sudo pacman -S --noconfirm --needed picom
sudo pacman -S --noconfirm --needed gzip
sudo pacman -S --noconfirm --needed p7zip
sudo pacman -S --noconfirm --needed unace
sudo pacman -S --noconfirm --needed unrar
sudo pacman -S --noconfirm --needed unzip
sudo pacman -S --noconfirm --needed virtualbox
#sudo pacman -S --noconfirm --needed virtualbox-host-dkms
sudo pacman -S --noconfirm --needed virtualbox-host-modules-arch 
sudo pacman -S --noconfirm --needed rofi
sudo pacman -S --noconfirm --needed thunar
sudo pacman -S --noconfirm --needed thunar-archive-plugin
sudo pacman -S --noconfirm --needed mousepad
sudo pacman -S --noconfirm --needed ristretto
sudo pacman -S --noconfirm --needed nitrogen
sudo pacman -S --noconfirm --needed lxappearance
sudo pacman -S --noconfirm --needed thunderbird
sudo pacman -S --noconfirm --needed keepassxc
sudo pacman -S --noconfirm --needed libappimage 
sudo pacman -S --noconfirm --needed gufw
sudo pacman -S --noconfirm --needed audacity 
sudo pacman -S --noconfirm --needed rhythmbox
sudo pacman -S --noconfirm --needed visual-studio-code-bin
sudo pacman -S --noconfirm --needed kvantum-qt5-git 
sudo pacman -S --noconfirm --needed kvantum-theme-arc
sudo pacman -S --noconfirm --needed qt5ct
sudo pacman -S --noconfirm --needed breeze
sudo pacman -S --noconfirm --needed qt5-base qt5-doc qt5-tools qtcreator
sudo pacman -S --noconfirm --needed archlinux-logout-git
sudo pacman -S --noconfirm --needed volumeicon
sudo pacman -S --noconfirm --needed pa-applet-git
sudo pacman -S --noconfirm --needed timeshift-autosnap
sudo pacman -S --noconfirm --needed dropbox
sudo pacman -S --noconfirm --needed kdeconnect
sudo pacman -S --noconfirm --needed hypnotix
sudo pacman -S --noconfirm --needed steam
sudo pacman -S --noconfirm --needed google-chrome
sudo pacman -S --noconfirm --needed brave
sudo pacman -S --noconfirm --needed guvcview
sudo pacman -S --noconfirm --needed obs-studio
sudo pacman -S --noconfirm --needed kdenlive
sudo pacman -S --noconfirm --needed clipgrab
sudo pacman -S --noconfirm --needed stacer
sudo pacman -S --noconfirm --needed libreoffice-fresh-pt-br
sudo pacman -S --noconfirm --needed archlinux-tweak-tool-git
sudo pacman -S --noconfirm --needed gnome-weather
sudo pacman -S --noconfirm --needed xfce4-power-manager
sudo pacman -S --noconfirm --needed thunar-volman
sudo pacman -S --noconfirm --needed xfce4-notifyd
sudo pacman -S --noconfirm --needed xfce4-appfinder
sudo pacman -S --noconfirm --needed xfce4-taskmanager
sudo pacman -S --noconfirm --needed xfce4-screensaver
sudo pacman -S --noconfirm --needed yad
sudo pacman -S --noconfirm --needed polybar
sudo pacman -S --noconfirm --needed grub-btrfs
sudo pacman -S --noconfirm --needed gsimplecal
sudo pacman -S --noconfirm --needed vimix-cursors
sudo pacman -S --noconfirm --needed qogir-gtk-theme-git 
sudo pacman -S --noconfirm --needed dracula-gtk-theme 
sudo pacman -S --noconfirm --needed endeavour
sudo pacman -S --noconfirm --needed sardi-colora-variations-icons-git
sudo pacman -S --noconfirm --needed arcolinux-chadwm-git
sudo pacman -S --noconfirm --needed albert
sudo pacman -S --noconfirm --needed powerline

##############################################################################################

  echo "Instalando apps aguarde!!!!"


  sudo cp /etc/nsswitch.conf /etc/nsswitch.conf.bak
  

echo
tput setaf 2
echo "################################################################"
echo "################### Instalação concluida com sucesso!!!"
echo "################################################################"
tput sgr0
echo
