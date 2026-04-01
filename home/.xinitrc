#!/bin/sh

session=${1:-dwm}

case $session in
i3)    exec i3;;
bspwm) exec bspwm;;
dk)    exec dk;;
dwm)   exec dbus-run-session dwm;;
lxde)  exec startlxde;;
xfce4) exec startxfce4;;
# No known session, try to run it as command
*) exec $1;;
esac

# execute
# startx ~/.xinitrc lxde
