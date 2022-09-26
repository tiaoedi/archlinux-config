#!/bin/bash


##################################################################################################################
################################      LINUXLIVRE       ###########################################################
##################################################################################################################
############# youtube: https://www.youtube.com/channel/UC7mTcm79pzUu4a46X1ththw ##################################
############# github.com/tiaoedi                                                ##################################
############# GRUPO DISCORD: https://discord.gg/2CCAE9hBTT                      ##################################
############# SUPORTE PIX: tiaoedi@gmail.com                                    ##################################
##################################################################################################################



echo "################################################################"
echo "################### Instalando apps por favor aguarde!!!"
echo "################################################################"


sudo pacman -Syyu --noconfirm --needed

echo "Instalando Obs agurde!!!"
sudo pacman -S obs-studio --noconfirm --needed

echo "Instalando kdenlive agurde!!!"
sudo pacman -S kdenlive --noconfirm --needed

echo "Instalando clipgrab agurde!!!"
sudo pacman -S clipgrab --noconfirm --needed

sudo pacman -S guvcview --noconfirm --needed

yay -S google-chrome --noconfirm --needed

echo "Instalando libreoffice-fresh-pt-br agurde!!!"
sudo pacman -S libreoffice-fresh-pt-br --noconfirm --needed


echo "Instalando steam agurde!!!"
sudo pacman -S steam --noconfirm --needed

yay -S stacer --noconfirm --needed 

yay -S hypnotix --noconfirm --needed  

sudo pacman -S kdeconnect --noconfirm --needed

echo "Instalando dropbox agurde!!!"
yay -S dropbox --noconfirm --needed

echo "Instalando timeshift-autosnap agurde!!!"

yay -S timeshift-autosnap --noconfirm --needed

yay -S volumeicon-gtk2 --noconfirm --needed

yay -S sublime-text-4 --noconfirm --needed

yay -S betterlockscreen --noconfirm --needed 
yay -S gsimplecal --noconfirm --needed 
yay -S libappimage --noconfirm --needed
yay -S Bluemail --noconfirm --needed
yay -S virtualbox-host-modules-arch --noconfirm --needed
yay -S fluent-icon-theme-git --noconfirm --needed
yay -S surfn-icons-git --noconfirm --needed
yay -S spotify-adblock --noconfirm --needed   
yay -S Sardi-Arc --noconfirm --needed 

sudo pacman -S gnome-weather --noconfirm --needed 

mkdir ~/Documentos/Videos-obs/

mkdir ~/Documentos/Videos-kdenlive/

echo "instalção concluida com sucesso!!!"