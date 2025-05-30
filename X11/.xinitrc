udiskie &

ibus-daemon -drx

# Disable DPMS and prevent screen from blanking
xset s off -dpms

# Set delay before autorepeat starts(in milliseconds) and the auto repeat rate(per second)
xset r rate 290 18

picom -b

xrdb -merge ~/.config/X11/.Xresources

exec i3

# To solve the seahorse error "No such secret collection at path: /"
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
