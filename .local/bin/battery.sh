#!/bin/bash

LEVEL="$(acpi -b | grep -v "unavailable" | awk -F "," '{print $2}' | cut -d "%" -f1 | cut -d " " -f2)"
STAT="$(acpitool | head -n 1 | awk '{print $4}')"
if [[ $STAT == "Discharging," || $STAT == "Full," ]]
then
		if [[ $LEVEL -gt 95 ]]
		then
			SYM=" "
		elif [[ $LEVEL -gt 65 ]]
		then
			SYM=" "
		elif [[ $LEVEL -gt 45 ]]
		then
			SYM=" "
		elif [[ $LEVEL -gt 15 ]]
		then
			SYM=" "
		elif [[ $LEVEL -le 15 ]]
		then
			SYM=" "
		fi
elif [[ $STAT == "Charging," || $STAT == "Not," ]]
then
	SYM=" "
fi

echo "${SYM}${LEVEL}%"
# echo "BAT: ${LEVEL}%"

exit 0
