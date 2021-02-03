#!/bin/bash

# a really nice looking setup to lock screen

PIC=/tmp/i3lock.png

BLUR="5x4"

scrot $PIC

convert $PIC -blur $BLUR $PIC
i3lock 	-e -i $PIC \
		--clock \
		--pass-media-keys --pass-power-keys \
		--pass-screen-keys --pass-volume-keys \
		--datestr="%A, %d %m %Y" \
		--linecolor=#282828 \
		--verifcolor=#ebdbb2 \
		--wrongcolor=#ebdbb2 \
		--timecolor=#ebdbb2 \
		--datecolor=#ebdbb2 \
		--greetercolor=#ebdbb2 \
		--ringcolor=#fabd2f \
		--insidecolor=282828d9 \
		--keyhlcolor=#b8bb26 \
		--bshlcolor=#cc241d \
		--ringvercolor=#458588 \
		--insidevercolor=83a598d9 \
		--ringwrongcolor=#cc241d \
		--insidewrongcolor=fb4934d9 \
		--time-font=Inconsolata \
		--date-font=Inconsolata \
		--layout-font=Inconsolata \
		--verif-font=Inconsolata \
		--wrong-font=Inconsolata \
		--greeter-font="Inconsolata Nerd Font" \
		--greetersize=75 \
		--noinputtext="No Input" \
		--locktext="Locking" \
		--veriftext="Verifying" \
		--wrongtext="Wrong!" \
		--lockfailedtext="Lock Failed!" \
		--greetertext="" \
		--greeterpos="955:605" \
		--datepos="960:545" \
		--timepos="960:525" \
		--radius=100 \
		--ring-width 3.0 \
		--indicator
rm $PIC
