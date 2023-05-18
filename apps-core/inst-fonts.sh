#!/bin/bash

cd /tmp/

git clone --depth=1 https://github.com/terroo/fonts
cd fonts
mv fonts ~/.local/share

fc-cache -fv

echo
tput setaf 2
echo "################################################################"
echo "################### Instalação concluida!!!"
echo "################################################################"
tput sgr0
echo