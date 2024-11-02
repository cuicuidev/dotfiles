#!/bin/bash

setxkbmap -layout es & # set spanish keyboard layout
xrandr --setprovideroutputsource modesetting NVIDIA-0 &
xrandr --output HDMI-1 --mode 1920x1080 --output DP-3 --mode 1920x1080 --left-of HDMI-1 &
xrandr --dpi 142 & # set large font size
# sudo systemctl start NetworkManager.service & # Connect to the ethernet

wal -i $(cat ~/.cache/wal/wal) & # set the wallpaper
dwmblocks & # start the dwmblocks scripts
# discord --start-minimized & # run Discord in the background
picom & # start picom

exec dwm # start Suckless' DWM
