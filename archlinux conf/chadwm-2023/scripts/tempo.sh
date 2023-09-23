#!/bin/bash

W=$(curl -s https://wttr.in/Guarulhos?format="%t\n" | head -n 3)
echo "$W "