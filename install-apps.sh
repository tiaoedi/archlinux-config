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

echo "Instalando brave agurde!!!"
yay -S brave --noconfirm --needed

echo "Instalando steam agurde!!!"
sudo pacman -S steam --noconfirm --needed

yay -S stacer --noconfirm --needed 

yay -S hypnotix --noconfirm --needed  

sudo pacman -S kdeconnect --noconfirm --needed

echo "Instalando dropbox agurde!!!"
yay -S dropbox --noconfirm --needed

echo "Instalando evolution agurde!!!"
sudo pacman -S evolution --noconfirm --needed

sudo pacman -S thunar --noconfirm --needed

sudo pacman -S mousepad --noconfirm --needed

sudo pacman -S ristretto --noconfirm --needed

paru -S timeshift-bin --noconfirm --needed

paru -S timeshift-autosnap --noconfirm --needed

echo "instalção concluida com sucesso!!!"