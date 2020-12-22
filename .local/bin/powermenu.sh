#!/bin/bash
declare -A CMDS
CMDS=(
  [" shutdown"]="systemctl poweroff"
  [" reboot"]="systemctl reboot"
  [" exit session"]="pkill dwm"
  [" lock screen"]="/home/egemen/.local/bin/locker.sh"
  [" quit menu"]="pkill rofi"
)

gen_list() {
		for i in "${!CMDS[@]}"
		do
				echo $i
		done
}

main() {
  power_menu=$( (gen_list) | rofi -dmenu -matching fuzzy -lines 5 -no-custom location 0 -p "power menu" )
  if [[ -n "${power_menu}" ]]
  then
    eval "${CMDS[$power_menu]}"
  else
    exit
  fi
}

main

exit 0
