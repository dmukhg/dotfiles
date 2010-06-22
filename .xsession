#!/bin/sh
gnome-settings-daemon &
synclient TapButton1=1 &
synclient RBCornerButton=3 &
synclient HorizEdgeScroll=1 &
gnome-power-manager &
~/.awesome/volume-monitor.sh &
nm-applet &
bluetooth-applet &
xmodmap /home/caesar/.Xmodmap &
awesome &
exec ck-launch-session gnome-session
