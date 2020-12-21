#!/bin/bash

BRI="$(brightnessctl | grep Current | cut -d "(" -f2 | cut -d "%" -f1)"

echo " ${BRI}%"
# echo "BRI: ${BRI}%"

exit 0
