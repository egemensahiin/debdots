#!/bin/bash

#GETVOL="$(ponymix | grep sink -A 2 | grep Volume | awk '{print $3}' | cut -d "%" -f1)"
#MUTED="$(ponymix | grep sink -A 2 | grep Muted)"

GETVOL="$(amixer | grep Master -A 6 | tail -n 1 | awk '{print $5}' | cut -d '%' -f1 | cut -d '[' -f2)"
MUTED="$(amixer | grep Master -A 6 | tail -n 1 | awk '{print $6}' | cut -d ']' -f1 | cut -d '[' -f2)"

if [[ $MUTED != "on" ]]
then
	echo " "
else
	if [[ $GETVOL -gt 70 ]]
	then
		SYM=" "
	elif [[ $GETVOL -ge 30 ]]
	then
		SYM=" "
	elif [[ $GETVOL -ge 0 ]]
	then
		SYM=" "
	fi
	echo "${SYM}${GETVOL}%"
fi

exit 0

