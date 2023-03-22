#!/bin/bash

pplet
run pamac-tray
#run "variety"
xfce4-power-manager &
#run blueberry-tray
#xrandr -s 1920x1080 &
xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 & 
/usr/lib/xfce4/notifyd/xfce4-notifyd &
/usr/libexec/xfce-polkit &
picom -b  --config ~/.config/dwm/picom.conf &
numlockx on
#volumeicon &
sxhkd -c ~/.config/dwm/sxhkdrc &
nitrogen --restore
~/.config/dwm/slstatus/slstatus &
xset led 3 &
kdeconnect-indicator &
xset r rate 300 50 &
xbacklight -set 35 &
xset s off &
xset -dpms &
albert &
##dropbox &
##run "insync start"
##run "spotify"
##run "ckb-next -b"
##run "discord"
##run "telegram-desktop"
##loop









