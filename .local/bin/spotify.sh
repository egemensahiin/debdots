#!/bin/bash

# For spotify client
SONG_CODE=$(xdotool search --class Spotify | head -n 1)
SONG_NAME=$(xdotool getwindowname ${SONG_CODE})
if [[ $SONG_NAME != "" ]]
then
  echo " ${SONG_NAME} | "
fi

# # For spotify-tui
# SONG=$(spotify-tui playback 2>/dev/null | awk -F " " '{print $NF}')
# STATUS=$(echo $SONG | awk '{print $1}')
# # if [[ $SONG == "" ]]
# # then
# #   echo ""
# #   exit 0
# # else
# case "$STATUS" in
#   契) echo "  $(echo $SONG | awk -F "契" '{print $NF}') "; exit 0 ;;
#   *) echo ""; exit 0 ;;
# esac
# # fi
