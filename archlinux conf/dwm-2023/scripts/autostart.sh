#!/bin/bash

xbacklight -set 35 &
xset r rate 300 50 &
xset s off &
xset -dpms &
#xrandr -s 1920x1080 &
run xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off &

pplet
run pamac-tray
#run "variety"
xfce4-power-manager &
#run blueberry-tray
/usr/lib/xfce4/notifyd/xfce4-notifyd &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom -b  --config ~/.config/dwm/picom.conf &
numlockx on
#volumeicon &
sxhkd -c ~/.config/dwm/sxhkdrc &
nitrogen --restore
albert &
~/.config/dwm/slstatus/slstatus &
xset led 3 &
kdeconnect-indicator &
xset r rate 300 50 &
xset s off &
xset -dpms &
##dropbox &

