#!/bin/bash

img=/tmp/i3lock.png

rm -f /tmp/i3lock*.png

scrot $img
convert $img -scale 4% -scale 2500% $img

i3lock -i $img

sleep 1

xset dpms force off
