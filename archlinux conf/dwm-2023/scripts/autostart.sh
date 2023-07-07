#!/bin/bash


if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}

#nm-applet &
run pamac-tray
variety &
xfce4-power-manager &
#run blueberry-tray
/usr/lib/xfce4/notifyd/xfce4-notifyd &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom -b  --config ~/.config/dwm/picom.conf &
numlockx on
#volumeicon &
sxhkd -c ~/.config/dwm/sxhkdrc &
#nitrogen --restore
feh --bg-fill ~/.config/variety/Downloaded/Unsplash/photo-1687789256744-626251390cf6.jpg &
slstatus &
xbacklight -set 50 &
xset led 3 &
kdeconnect-indicator &
xset r rate 300 50 &
xset s off &
xset -dpms &
dropbox &

