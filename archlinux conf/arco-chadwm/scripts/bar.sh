#!/bin/dash

 #^c$var^ = fg color
 #^b$var^ = bg color #60000000

interval=0

# load colors
. ~/.config/arco-chadwm/scripts/bar_themes/nord


cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$black^ ^b$green^ CPU"
  printf "^c$white^ ^b$grey^ $cpu_val"
}

#pkg_updates() {
 # updates=$(checkupdates | wc -l)   # arch

  #if [ -z "$updates" ]; then
   # printf "  ^c$green^    Fully Updated"
  #else
   # printf "  ^c$green^    $updates"" updates"
  #fi
#}

#battery() {
 # get_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
  #printf "^c$blue^   $get_capacity"
#}

#brightness() {
 # printf "^c$red^   "
  #printf "^c$red^%.0f\n" $(cat /sys/class/backlight/*/brightness)
#}


mem() {
  printf "^c$blue^^b$black^ Ram "
  printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

#wlan() {
#	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
#	up) printf "^c$black^ ^b$blue^ 󰤨 ^d^%s" " ^c$blue^Connected" ;;
#	down) printf "^c$black^ ^b$blue^ 󰤭 ^d^%s" " ^c$blue^Disconnected" ;;
#	esac
#}

clock() {
	printf "^c$black^ ^b$green^  "
	printf "^c$black^^b$green^ $(date '+%d/%m/%y %H:%M')"
}


weather() {
	printf "^c$blue^ ^b$black^  "
	printf "^c$blue^^b$black^ $(/home/pcarch/.config/arco-chadwm/scripts/weather.py)"
}

#pavolume() {
#	printf "^c$blue^ ^b$black^  "
#	printf "^c$blue^^b$black^ $(/home/pcarch/.config/arco-chadwm/scripts/pavolume.sh)  "
#}


while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 2 && xsetroot -name "$updates $(battery) $(brightness) $(weather) $(cpu) $(mem) $(wlan) $(clock) $(pavolume) "
done
