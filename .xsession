#!/bin/sh
xmodmap /home/caesar/.Xmodmap &
synclient TapButton1=1 &
synclient RBCornerButton=3 &
synclient HorizEdgeScroll=1 &
gnome-power-manager &
~/.awesome/volume-monitor.sh &
nm-applet &
bluetooth-applet &
conky &
exec awesome
