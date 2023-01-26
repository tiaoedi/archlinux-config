#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/chadwm/scripts/bar_themes/dracula

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$black^ ^b$green^ CPU"
  printf "^c$white^ ^b$grey^ $cpu_val"
}

arch() {
  printf "^c$green^ ^b$black^arch"
  printf "^c$green^^b$black^ $(/home/pcarch/.config/chadwm/scripts/upd.sh)"
}

mem() {
  printf "^c$blue^^b$black^  "
  printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

clock() {
	printf "^c$black^ ^b$darkblue^🕑"
	printf "^c$black^^b$blue^ $(date '+%d-%m-%Y - %H:%M')"
}

weather() {
  printf "^c$blue^ ^b$black^🌤️"
  printf "^c$blue^^b$black^$(/home/pcarch/.config/chadwm/scripts/wetather_guar.sh)"
}

volume() {
  printf "^c$blue^ ^b$black^   "
  printf "^c$blue^^b$black^ $(~/.config/chadwm/scripts/volume.sh)"
}


while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$(weather) $(arch) $updates $(battery) $(brightness) $(cpu) $(mem) $(wlan) $(clock) $(volume)"
done
