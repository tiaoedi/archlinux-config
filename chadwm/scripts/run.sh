#!/bin/sh

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

#xrdb merge ~/.Xresources 
xbacklight -set 50 &
xset r rate 300 50 &
#run nm-applet
#run pamac-tray
#run "albert"
xfce4-power-manager &
run "blueberry-tray"
run "/usr/lib/xfce4/notifyd/xfce4-notifyd"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
picom -b  --config ~/.config/chadwm/picom/picom.conf &
run "numlockx on"
#run "pasystray" &
#run "volumeicon" &
sxhkd -c ~/.config/chadwm/sxhkd/sxhkdrc &
#run nitrogen --restore
#albert &
xset s off &
xset -dpms &
run "xset led 3" & 
run kdeconnect-indicator &
run "dropbox"
feh --bg-fill ~/.config/chadwm/wallpaper/chadwm1.png &
#run "slstatus" &
run "variety" &
#run "insync start"
#run "spotify"
#run "ckb-next -b"
#run "discord"
#run "telegram-desktop"

pkill bar.sh
~/.config/chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
