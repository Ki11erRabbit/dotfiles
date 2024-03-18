#!/bin/sh


swayidle -w \
    timeout 900 'wlopm --off eDP-1' \
        resume 'wlopm --on eDP-1' \
    timeout 1000 '/home/ki11errabbit/.local/bin/lockscreen.sh' \
        resume 'wlopm --on eDP-1' \
    before-sleep '/home/ki11errabbit/.local/bin/lockscreen.sh' &
