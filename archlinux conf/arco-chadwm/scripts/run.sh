#!/bin/sh


#xrdb merge ~/.Xresources 
xbacklight -set 10 &
xset r rate 350 50 &

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}

#run nm-applet
#run pamac-tray
#run "variety"
run "xfce4-power-manager"
run "blueberry-tray"
run "/usr/lib/xfce4/notifyd/xfce4-notifyd"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
picom -b  --config ~/.config/arco-chadwm/picom/picom.conf &
run "numlockx on"
#run "volumeicon" &
sxhkd -c ~/.config/arco-chadwm/sxhkd/sxhkdrc &
run nitrogen --restore




xset led 3 &
run kdeconnect-indicator &
#run "dropbox"
#run "insync start"
#run "spotify"
#run "ckb-next -b"
#run "discord"
#run "telegram-desktop"

pkill bar.sh
~/.config/arco-chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
