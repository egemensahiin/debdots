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
		--ringcolor=#98971a \
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
		--greeter-font=Inconsolata \
		--noinputtext="No Input" \
		--locktext="Locking" \
		--veriftext="Verifying" \
		--wrongtext="Wrong!" \
		--lockfailedtext="Lock Failed!" \
		--greetertext="Locked" \
		--greeterpos="960:580" \
		--datepos="960:550" \
		--timepos="960:530" \
		--radius=100 \
		--ring-width 3.0 \
		--indicator
rm $PIC
