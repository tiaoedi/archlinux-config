#!/usr/bin/env bash
if ! [ -x "$(command -v archlinux-logout)" ]; then
   sh ~/.config/leftwm/themes/current/polybar/scripts/powermenu.sh
else
    archlinux-logout
fi
