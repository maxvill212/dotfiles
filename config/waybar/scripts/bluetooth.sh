#!/bin/bash

BLUE=$(bluetoothctl info | grep Name: | cut -d ':' -f 2)
ON=$(bluetoothctl show | grep Powered:)

if [ -z "$ON" ]; then
	echo 
elif [ -z "$BLUE" ]; then
	echo   
else
	echo  $BLUE
fi
