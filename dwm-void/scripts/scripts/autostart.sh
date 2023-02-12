#!/bin/bash

setxkbmap -layout br
xbacklight -set 25 &
xset r rate 300 50 &
xset s off &
xset -dpms &
pplet &
run pamac-tray
#run "variety"
xfce4-power-manager &
#run blueberry-tray
/usr/libexec/xfce-polkit &
picom -b  --config ~/.config/dwm/picom.conf &
numlockx on
#volumeicon &
sxhkd -c ~/.config/dwm/sxhkdrc &
nitrogen --restore

~/.config/dwm/slstatus/slstatus &
xset led 3 &
kdeconnect-indicator &
dropbox &
##run "insync start"
##run "spotify"
##run "ckb-next -b"
##run "discord"
##run "telegram-desktop"
##loop
