#!/bin/bash

#########################################
########### instalação de apps ##########
#########################################

echo "instalção de apps!!!!!"
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
sudo pacman -S gnome-weather --noconfirm --needed 

mkdir /home/pclinux/Documentos/Videos-obs/

mkdir /home/pclinux/Documentos/Videos-kdenlive/

echo "instalção concluida com sucesso!!!"