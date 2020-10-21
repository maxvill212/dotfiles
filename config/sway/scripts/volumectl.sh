#!/bin/bash

# Script to control volume, for ~/.config/sway/config
# Find where the sound is coming from (0 is default, other can be for ex. bluetooth headphones)
SINK=$(pacmd list-sinks | grep index: | grep -v "0" | awk '{ print $NF }')

# If it's 0, assign it (the search will return nothing if it's 0
if [ -z "$SINK" ]; then
	SINK="0"
fi

# Detects if mute or volume change was clicked
if [ "$1" != "m" ]; then
# Change volume
		pamixer --sink "$SINK" -"$1" "$2" &
# Toggle mute on/off
else
	pamixer --sink "$SINK" -t &
fi
