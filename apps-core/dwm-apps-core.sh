#!/bin/bash
#set -e

##################################################################################################################
################################      LINUXLIVRE       ###########################################################
##################################################################################################################
############# youtube: https://www.youtube.com/channel/UC7mTcm79pzUu4a46X1ththw ##################################
############# github.com/tiaoedi                                                ##################################
############# GRUPO DISCORD: https://discord.gg/2CCAE9hBTT                      ##################################
############# SUPORTE PIX: tiaoedi@gmail.com                                    ##################################
##################################################################################################################


sudo pacman -Syyu
sudo pacman -S --noconfirm --needed git
sudo pacman -S --noconfirm --needed wget
sudo pacman -S --noconfirm --needed curl

if grep -q arcolinux_repo /etc/pacman.conf; then

  echo
  tput setaf 2
  echo "################################################################"
  echo "################ ArcoLinux repos are already in /etc/pacman.conf "
  echo "################################################################"
  tput sgr0
  echo
  else
  echo
  tput setaf 2
  echo "################################################################"
  echo "################### Getting the keys and mirrors for ArcoLinux"
  echo "################################################################"
  tput sgr0
  echo
  sh get-the-keys-and-repos.sh*
  sudo pacman -Syyu
fi

echo
tput setaf 2
echo "################################################################"
echo "################### Instalando apps por favor aguarde!!!"
echo "################################################################"
tput sgr0
echo

 sudo pacman -Syyu --noconfirm --needed


##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################

sudo pacman -Syyu

echo
tput setaf 2
echo "################################################################"
echo "################### Core software"
echo "################################################################"
tput sgr0
echo

#sudo pacman -S --noconfirm --needed ttf-wps-fonts
#sudo pacman -S --noconfirm --needed wps-office
#sudo pacman -S --noconfirm --needed wps-office-mime
sudo pacman -S --noconfirm --needed xf86-video-intel
sudo pacman -S --noconfirm --needed xorg
sudo pacman -S --noconfirm --needed dwm
sudo pacman -S --noconfirm --needed sxhkd
sudo pacman -S --noconfirm --needed sddm
sudo pacman -S --noconfirm --needed neovim
sudo pacman -S --noconfirm --needed adobe-source-sans-fonts
sudo pacman -S --noconfirm --needed aic94xx-firmware
sudo pacman -S --noconfirm --needed alacritty
sudo pacman -S --noconfirm --needed alacritty-themes
sudo pacman -S --noconfirm --needed arandr
#sudo pacman -S --noconfirm --needed arc-darkest-theme-git
sudo pacman -S --noconfirm --needed arc-gtk-theme
sudo pacman -S --noconfirm --needed archiso
#sudo pacman -S --noconfirm --needed asciinema
sudo pacman -S --noconfirm --needed avahi
sudo pacman -S --noconfirm --needed awesome-terminal-fonts
#sudo pacman -S --noconfirm --needed ayu-theme
sudo pacman -S --noconfirm --needed baobab
#sudo pacman -S --noconfirm --needed base16-alacritty-git
sudo pacman -S --noconfirm --needed bash-completion
sudo pacman -S --noconfirm --needed bat
sudo pacman -S --noconfirm --needed bibata-cursor-theme-bin
sudo pacman -S --noconfirm --needed catfish
#sudo pacman -S --noconfirm --needed chromium
sudo pacman -S --noconfirm --needed cpuid
sudo pacman -S --noconfirm --needed dconf-editor
sudo pacman -S --noconfirm --needed discord
sudo pacman -S --noconfirm --needed dmenu
sudo pacman -S --noconfirm --needed ufw
sudo pacman -S --noconfirm --needed downgrade
if [ ! -f /usr/bin/duf ]; then
  sudo pacman -S --noconfirm --needed duf
fi
sudo pacman -S --noconfirm --needed evince
sudo pacman -S --noconfirm --needed expac
sudo pacman -S --noconfirm --needed feh
sudo pacman -S --noconfirm --needed file-roller
#sudo pacman -S --noconfirm --needed firefox
#sudo pacman -S --noconfirm --needed fish
sudo pacman -S --noconfirm --needed flameshot-git
#sudo pacman -S --noconfirm --needed fluent-icon-theme-git
sudo pacman -S --noconfirm --needed font-manager
sudo pacman -S --noconfirm --needed galculator
sudo pacman -S --noconfirm --needed gimp
sudo pacman -S --noconfirm --needed gitahead-bin
sudo pacman -S --noconfirm --needed gitfiend
sudo pacman -S --noconfirm --needed gnome-disk-utility
sudo pacman -S --noconfirm --needed gparted
#sudo pacman -S --noconfirm --needed grub-customizer
sudo pacman -S --noconfirm --needed gtop
sudo pacman -S --noconfirm --needed gvfs-smb
sudo pacman -S --noconfirm --needed hardcode-fixer-git
sudo pacman -S --noconfirm --needed hardinfo-gtk3
sudo pacman -S --noconfirm --needed hddtemp
sudo pacman -S --noconfirm --needed htop
sudo pacman -S --noconfirm --needed hw-probe
#sudo pacman -S --noconfirm --needed inkscape
#sudo pacman -S --noconfirm --needed insync
sudo pacman -S --noconfirm --needed kvantum
sudo pacman -S --noconfirm --needed linux-firmware-qlogic
#sudo pacman -S --noconfirm --needed lastpass
sudo pacman -S --noconfirm --needed logrotate
sudo pacman -S --noconfirm --needed lolcat
sudo pacman -S --noconfirm --needed lshw
sudo pacman -S --noconfirm --needed man-db
sudo pacman -S --noconfirm --needed man-pages
sudo pacman -S --noconfirm --needed mkinitcpio-firmware
sudo pacman -S --noconfirm --needed mlocate
sudo pacman -S --noconfirm --needed meld
sudo pacman -S --noconfirm --needed mintstick-git
sudo pacman -S --noconfirm --needed most
sudo pacman -S --noconfirm --needed neofetch
sudo pacman -S --noconfirm --needed network-manager-applet
sudo pacman -S --noconfirm --needed networkmanager-openvpn
sudo pacman -S --noconfirm --needed nitrogen
sudo pacman -S --noconfirm --needed nomacs
sudo pacman -S --noconfirm --needed noto-fonts
sudo pacman -S --noconfirm --needed ntp
sudo pacman -S --noconfirm --needed nss-mdns
sudo pacman -S --noconfirm --needed numlockx
sudo pacman -S --noconfirm --needed oh-my-zsh-git
sudo pacman -S --noconfirm --needed openresolv
sudo pacman -S --noconfirm --needed paru-bin
sudo pacman -S --noconfirm --needed pavucontrol
sudo pacman -S --noconfirm --needed playerctl
sudo pacman -S --noconfirm --needed polkit-gnome
sudo pacman -S --noconfirm --needed python-pylint
sudo pacman -S --noconfirm --needed python-pywal
sudo pacman -S --noconfirm --needed pv
sudo pacman -S --noconfirm --needed qbittorrent
sudo pacman -S --noconfirm --needed rate-mirrors-bin
sudo pacman -S --noconfirm --needed ripgrep
sudo pacman -S --noconfirm --needed rsync
sudo pacman -S --noconfirm --needed scrot
sudo pacman -S --noconfirm --needed sardi-icons
#sudo pacman -S --noconfirm --needed simplescreenrecorder
sudo pacman -S --noconfirm --needed sparklines-git
sudo pacman -S --noconfirm --needed speedtest-cli-git
#sudo pacman -S --noconfirm --needed spotify
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
sudo pacman -S --noconfirm --needed variety
sudo pacman -S --noconfirm --needed visual-studio-code-bin
sudo pacman -S --noconfirm --needed vivaldi
sudo pacman -S --noconfirm --needed vivaldi-ffmpeg-codecs
sudo pacman -S --noconfirm --needed vivaldi-widevine
sudo pacman -S --noconfirm --needed vlc
sudo pacman -S --noconfirm --needed wd719x-firmware
sudo pacman -S --noconfirm --needed wget
sudo pacman -S --noconfirm --needed wttr
sudo pacman -S --noconfirm --needed xcolor
sudo pacman -S --noconfirm --needed xdg-user-dirs
sudo pacman -S --noconfirm --needed xorg-xkill
sudo pacman -S --noconfirm --needed yay-bin
sudo pacman -S --noconfirm --needed zsh
sudo pacman -S --noconfirm --needed zsh-completions
sudo pacman -S --noconfirm --needed zsh-syntax-highlighting
sudo pacman -S --noconfirm --needed obs-studio
sudo pacman -S --noconfirm --needed kdenlive
sudo pacman -S --noconfirm --needed clipgrab
sudo pacman -S --noconfirm --needed stacer
sudo pacman -S --noconfirm --needed libreoffice-fresh-pt-br
sudo pacman -S --noconfirm --needed grub-btrfs
sudo pacman -S --noconfirm --needed timeshift-autosnap
sudo pacman -S --noconfirm --needed vimix-cursors
sudo pacman -S --noconfirm --needed powerline
sudo pacman -S --noconfirm --needed guvcview
sudo pacman -S --noconfirm --needed dropbox
sudo pacman -S --noconfirm --needed kdeconnect
sudo pacman -S --noconfirm --needed hypnotix
#sudo pacman -S --noconfirm --needed steam
sudo pacman -S --noconfirm --needed google-chrome
sudo pacman -S --noconfirm --needed brave
sudo pacman -S --noconfirm --needed thunderbird
sudo pacman -S --noconfirm --needed keepassxc
sudo pacman -S --noconfirm --needed ristretto
sudo pacman -S --noconfirm --needed thunar
sudo pacman -S --noconfirm --needed virtualbox-host-modules-arch 
sudo pacman -S --noconfirm --needed virtualbox
sudo systemctl enable avahi-daemon.service
sudo systemctl enable ntpd.service
sudo systemctl enable sddm

if ! command -v ufw &>/dev/null; then
    echo "UFW não está instalado. Instalando..."
    sudo pacman -Syu --noconfirm ufw
fi

if ! sudo ufw status | grep -q "Status: active"; then
    echo "UFW não está ativo. Ativando..."
    sudo ufw enable
fi

echo "UFW está instalado e ativado."

sudo systemctl enable ufw 
sh ufw-config.sh*

#sudo pacman -S --noconfirm --needed rxvt-unicode
#sudo pacman -S --noconfirm --needed urxvt-fullscreen
#sudo pacman -S --noconfirm --needed urxvt-perls
#sudo pacman -S --noconfirm --needed urxvt-resize-font-git

sudo pacman -S --noconfirm --needed gzip
sudo pacman -S --noconfirm --needed p7zip
sudo pacman -S --noconfirm --needed unace
sudo pacman -S --noconfirm --needed unrar
sudo pacman -S --noconfirm --needed unzip

if [ ! -f /usr/share/xsessions/plasma.desktop ]; then
  sudo pacman -S --noconfirm --needed qt5ct
fi

###############################################################################################

# when on xfce

if [ -f /usr/share/xsessions/xfce.desktop ]; then

  echo
  tput setaf 2
  echo "################################################################"
  echo "################### Installing software for Xfce"
  echo "################################################################"
  tput sgr0
  echo

  sudo pacman -S --noconfirm --needed menulibre
  sudo pacman -S --noconfirm --needed mugshot
  sudo pacman -S --noconfirm --needed prot16-xfce4-terminal
  sudo pacman -S --noconfirm --needed tempus-themes-xfce4-terminal-git
  sudo pacman -S --noconfirm --needed xfce4-terminal-base16-colors-git

fi

sh inst-fonts.sh*

#bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"
echo
tput setaf 6
echo "################################################################"
echo "################### Instalação concluida!!!!"
echo "################################################################"
tput sgr0
echo