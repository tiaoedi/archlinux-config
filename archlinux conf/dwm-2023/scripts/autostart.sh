#!/bin/bash


if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


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

slstatus &
xbacklight -set 35 &
xrandr --output HDMI2 --mode 1920x1080 &
xset led 3 &
kdeconnect-indicator &
xset r rate 300 50 &
xset s off &
xset -dpms &
dropbox &
##run "insync start"
##run "spotify"
##run "ckb-next -b"
##run "discord"
##run "telegram-desktop"
##loop
