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



func_install() {
	if pacman -Qi $1 &> /dev/null; then
		tput setaf 2
  		echo "###############################################################################"
  		echo "################## O pacote "$1" Ja esta instalado!!!"
      	echo "###############################################################################"
      	echo
		tput sgr0
	else
    	tput setaf 3
    	echo "###############################################################################"
    	echo "##################  Instalando o pacote!!! "  $1
    	echo "###############################################################################"
    	echo
    	tput sgr0
    	sudo pacman -S --noconfirm --needed $1 
    fi
}

function_pulseaudio() {
	list=(
	pulseaudio
	pulseaudio-alsa
	pavucontrol
	alsa-firmware
	alsa-lib
	alsa-plugins
	alsa-utils
	gstreamer
	gst-plugins-good
	gst-plugins-bad
	gst-plugins-base
	gst-plugins-ugly
	playerctl
	volumeicon
	)

	count=0

	for name in "${list[@]}" ; do
		count=$[count+1]
		tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
		func_install $name
	done

	###############################################################################

	tput setaf 11;
	echo "################################################################"
	echo "Software Instalado!!!"
	echo "################################################################"
	echo;tput sgr0
}

function_pipewire() {
	list=(
	pipewire
	pipewire-pulse
	pipewire-alsa
	pipewire-jack
	pipewire-zeroconf
	pavucontrol
	alsa-utils
	alsa-plugins
	alsa-lib
	alsa-firmware
	gstreamer
	gst-plugins-good
	gst-plugins-bad
	gst-plugins-base
	gst-plugins-ugly   
	volumeicon
	playerctl
	)

	count=0

	for name in "${list[@]}" ; do
		count=$[count+1]
		tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
		func_install $name
	done

	###############################################################################

	tput setaf 11;
	echo "################################################################"
	echo "Software Instalado!!!!"
	echo "################################################################"
	echo;tput sgr0
}

echo
tput setaf 2
echo "################################################################"
echo "#####     Escolha pulseaudio ou pipewire!!!                 ####"
echo "################################################################"
tput sgr0
echo
echo "Select the correct number"
echo
echo "0.  Do nothing"
echo "1.  Pulseaudio"
echo "2.  Pipewire"
echo "Type the number..."

read CHOICE

case $CHOICE in

    0 )
		echo
		echo "########################################"
		echo "We did nothing as per your request"
		echo "########################################"
		echo
		;;

    1 )
		function_pulseaudio 
      	;;
    2 )
		function_pipewire
		;;
    * )
		echo "#################################"
		echo "Choose the correct number"
		echo "#################################"
		;;
esac
