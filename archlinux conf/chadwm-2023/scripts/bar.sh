#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/chadwm/scripts/bar_themes/onedark

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$white^ ^b$black^ CPU"
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
  printf "^c$green^^b$black^$(~/.config/chadwm/scripts/upd.sh)"
}



#brightness() {
 # printf "^c$red^   "
  #printf "^c$red^%.0f\n" $(cat /sys/class/backlight/ -set 50/brightness)
#}

mem() {
   printf "^c$blue^^b$black^  "
  printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

#wlan() {
	#case "$(cat /sys/class/net/enp3s0*/operstate 2>/dev/null)" in
	#up) printf "^c$white^ ^b$black^  ^d^%s" " ^c$black^" ;;
	#down) printf "^c$black^ ^b$black^ 󰤭 ^d^%s" " ^c$black^0" ;;
	#esac
#}


volume() {
  printf "^c$white^^b$black^ "
  printf "^c$white^^b$black^$(~/.config/chadwm/scripts/volume.sh)"
}

weather() {
  printf "^c$blue^ ^b$black^  "
  printf "^c$blue^^b$black^$(~/.config/chadwm/scripts/tem.py)"
}

clock() {
	printf "^c$white^ ^b$black^  "
	printf "^c$white^^b$black^ $(date '+%d/%m/%y %H:%M') "
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 2 && xsetroot -name " $(weather) $(upd)$updates $(battery) $(brightness) $(cpu) $(mem) $(clock) $(volume)"
done
