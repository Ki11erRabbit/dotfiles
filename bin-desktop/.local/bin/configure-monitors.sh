#!/bin/sh


wlr-randr --output HDMI-A-1 --pos 0,0 --transform 270 --output DP-1 --pos 1080,300 --adaptive-sync enabled --output DP-2 --pos 3640,371
wlr-randr --output DP-1 --mode 2560x1440@120.029999Hz --adaptive-sync enabled 
