#!/bin/bash


	case "$(cat /sys/class/net/enp3s0*/operstate 2>/dev/null)" in
	up) printf "  "  ;;
	down) printf " 󰤭 " ;;
	esac

