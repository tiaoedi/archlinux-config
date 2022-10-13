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
echo "################### Instalando Kernel linux-xanmod-edge por favor agurde!!!"
echo "################################################################"
tput sgr0
echo


sudo pacman -S --noconfirm --needed linux-xanmod-edge 
sudo pacman -S --noconfirm --needed linux-xanmod-headers 
sudo pacman -S --noconfirm --needed linux-xanmod-edge-headers
sudo pacman -S --noconfirm --needed grub


echo
tput setaf 2
echo "################################################################"
echo "################### Instalação concluida com sucesso!!!"
echo "################################################################"
tput sgr0
echo
