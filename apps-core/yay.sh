#!/bin/bash

cd /tmp/

git clone --depth=1 https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo
tput setaf 2
echo "################################################################"
echo "################### Instalação concluida!!!"
echo "################################################################"
tput sgr0
echo