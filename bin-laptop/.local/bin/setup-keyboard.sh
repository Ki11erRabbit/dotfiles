#!/bin/sh

model=$(sudo /run/current-system/sw/bin/dmidecode | grep Version | head -n 2 | tail -n 1 | awk '{print $3}')


case $model in
    T440p) kmonad /home/ki11errabbit/.config/kmonad/t44p.kbd ;;
esac

#riverctl keyboard-layout -model pc104 -variant colemak_dh -options "grp:ctl_space_toggle" us
