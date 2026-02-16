#!/usr/bin/env bash
exec swayidle -w \
  timeout 10 'swaylock -f --image /home/pc120/.config/niri/1.jpg --clock --indicator --indicator-radius 100 --indicator-thickness 7' \
  timeout 300 'niri msg action power-off-monitors' \
  timeout 600 'systemctl suspend' \
  before-sleep 'pidof swaylock || swaylock -f --image /home/pc120/.config/niri/1.jpg --clock --indicator --indicator-radius 100 --indicator-thickness 7'
i
