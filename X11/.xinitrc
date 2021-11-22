udiskie &

ibus-daemon -drx

# Disable DPMS and prevent screen from blanking
xset s off -dpms

# Set delay before autorepeat starts(in milliseconds) and the auto repeat rate(per second)
xset r rate 290 18

picom -b

xrdb -merge ~/.config/X11/.Xresources

exec i3
