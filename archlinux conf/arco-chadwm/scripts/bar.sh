#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/arco-chadwm/scripts/bar_themes/dracula

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$white^ ^b$black^ CPU"
  printf "^c$white^ ^b$black^ $cpu_val"
}

#pkg_updates() {
 # updates=$(checkupdates | wc -l)   # arch

  #if [ -z "$updates" ]; then
   # printf " ^c$green^  Fully Updated"
  #else
   # printf " ^c$green^  $updates"" arch"
  #fi
#}

upd() {
  printf "^c$green^ ^b$black^arch "
  printf "^c$green^^b$black^$(/home/archpc/.config/arco-chadwm/scripts/upd.sh)"
}



#brightness() {
 # printf "^c$red^   "
  #printf "^c$red^%.0f\n" $(cat /sys/class/backlight/*/brightness)
#}

mem() {
  printf "^c$blue^^b$black^  "
  printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/enp3s0*/operstate 2>/dev/null)" in
	up) printf "^c$black^ ^b$blue^ 󰤨 ^d^%s" " ^c$blue^Con" ;;
	down) printf "^c$black^ ^b$blue^ 󰤭 ^d^%s" " ^c$blue^Dis" ;;
	esac
}


volume() {
  printf "^c$blue^ ^b$black^ 🔊 "
  printf "^c$blue^^b$black^$(~/.config/arco-chadwm/scripts/volume.sh)"
}

weather() {
  printf "^c$blue^ ^b$black^🌤️"
  printf "^c$blue^^b$black^$(/home/archpc/.config/arco-chadwm/scripts/tem.py)"
}

clock() {
	printf "^c$black^ ^b$blue^  "
	printf "^c$black^^b$blue^ $(date '+%d/%m/%y %H:%M')  "
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 2 && xsetroot -name " $(weather) $(upd)$updates $(battery) $(brightness) $(cpu) $(mem) $(wlan) $(clock) $(volume)"
done
