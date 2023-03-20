#!/bin/bash

# Atualiza o sistema
sudo pacman -Syu

# Instala as dependências
sudo pacman -S --needed base-devel libx11 libxinerama libxft ncurses

# Baixa e descompacta o código fonte do DWM
wget https://dl.suckless.org/dwm/dwm-6.4.tar.gz
tar xvf dwm-6.4.tar.gzi

# Entra na pasta do código fonte
cd dwm-6.4

# Configura e compila o DWM
make clean install

# Adiciona o DWM ao arquivo .xinitrc para iniciar o DWM automaticamente no próximo login
echo "exec dwm" >> ~/.xinitrc

