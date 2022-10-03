#!/bin/bash

##################################################################################################################
################################      LINUXLIVRE       ###########################################################
##################################################################################################################
############# youtube: https://www.youtube.com/channel/UC7mTcm79pzUu4a46X1ththw ##################################
############# github.com/tiaoedi                                                ##################################
############# GRUPO DISCORD: https://discord.gg/2CCAE9hBTT                      ##################################
############# SUPORTE PIX: tiaoedi@gmail.com                                    ##################################
##################################################################################################################



sudo pacman -S --noconfirm --needed btrfs-assistant
sudo pacman -S --noconfirm --needed grub-btrfs
sudo pacman -S --noconfirm --needed snap-pac
sudo pacman -S --noconfirm --needed snapper
sudo pacman -S --noconfirm --needed snapper-gui-git
sudo pacman -S --noconfirm --needed snapper-support

sudo snapper -c root create-config /

echo "first manual snapshot"

snapper -c root create --description "initial snapshot"

sudo chmod a+rx /.snapshots
sudo chown :users /.snapshots