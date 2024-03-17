#!/bin/bash
#   ___ _____ ___ _     _____   ____  _             _    
#  / _ \_   _|_ _| |   | ____| / ___|| |_ __ _ _ __| |_  
# | | | || |  | || |   |  _|   \___ \| __/ _` | '__| __| 
# | |_| || |  | || |___| |___   ___) | || (_| | |  | |_  
#  \__\_\|_| |___|_____|_____| |____/ \__\__,_|_|   \__| 
#                                                        
#  
# by Stephan Raabe (2023) 
# ----------------------------------------------------- 

# My screen resolution
# xrandr --rate 120

# For Virtual Machine 
# xrandr --output Virtual-1 --mode 1920x1080

# Keyboard layout
setxkbmap br

#nm-applet &
variety &
xfce4-power-manager &
#run blueberry-tray
/usr/lib/xfce4/notifyd/xfce4-notifyd &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom -b  --config ~/.config/qtile/picom.conf &
numlockx on
#volumeicon &
sxhkd -c ~/.config/qtile/sxhkdrc &
#nitrogen --restore
feh --bg-fill ~/Imagens/wallpaper/wallhaven-dgegxl.jpg &
xbacklight -set 50 &
xset led 3 &
kdeconnect-indicator &
xset r rate 300 50 &
xset s off &
xset -dpms &
#dropbox &

# Load notification service
dunst &

# Setup Wallpaper and update colors
~/dotfiles/qtile/scripts/wallpaper.sh init
