#!/bin/bash
_w=$(curl -s wttr.in/Guarulhos\?format\=1)
_d=$(date '+%d/%m/%y %H:%M')
_m=$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)
_c=$(grep -o "^[^ ]*" /proc/loadavg)

 while xsetroot -name  "  $_w | Cpu $_c |  Ram $_m |  $_d | "
do
    	sleep -10
    done &
    exec dwm
#
