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


wget https://aur.archlinux.org/cgit/aur.git/snapshot/linux-xanmod-edge.tar.gz

tar xzf linux-xanmod-edge*

rm linux-xanmod-edge.tar.gz

FIND="_microarchitecture=0"
REPLACE="_microarchitecture=38"
sed -i "s/$FIND/$REPLACE/g" linux-xanmod-edge/PKGBUILD

# FIND="use_numa=y"
# REPLACE="use_numa=n"
# sed -i "s/$FIND/$REPLACE/g" linux-xanmod/PKGBUILD

# FIND="use_tracers=y"
# REPLACE="use_tracers=n"
# sed -i "s/$FIND/$REPLACE/g" linux-xanmod/PKGBUILD

# FIND="_compiler=gcc"
# REPLACE="_compiler=gcc"
# sed -i "s/$FIND/$REPLACE/g" linux-xanmod/PKGBUILD

# FIND="_compress_modules=n"
# REPLACE="_compress_modules=n"
# sed -i "s/$FIND/$REPLACE/g" linux-xanmod/PKGBUILD

FIND="_localmodcfg=n"
REPLACE="_localmodcfg=y"
sed -i "s/$FIND/$REPLACE/g" linux-xanmod-edge/PKGBUILD

cd linux-xanmod-edge

makepkg -s --skippgpcheck


echo
tput setaf 2
echo "################################################################"
echo "################### Instalação concluida com sucesso!!!"
echo "################################################################"
tput sgr0
echo
