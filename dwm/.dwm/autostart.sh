#!/bin/bash

###---Startup Jingle---###
mpv ~/.dwm/Jingles/startup.wav &

###---Xrandr---###
#xrandr --output HDMI-A-0 --left-of DisplayPort-1 --output DisplayPort-1
#xrandr --output DisplayPort-0 --off --output DisplayPort-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DisplayPort-2 --off --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal
#redshift -P -O 8550
#xrandr --output DisplayPort-0 --off --output DisplayPort-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DisplayPort-2 --off --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal

xrandr --output DisplayPort-0 --primary --mode 2560x1440 --pos 1080x169 --rotate normal --output DisplayPort-1 --mode 1920x1080 --pos 3640x349 --rotate normal --output DisplayPort-2 --off --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate right
#xrandr --output DisplayPort-0 --primary --mode 2560x1440 --pos 1080x169 --rotate normal --output DisplayPort-1 --mode 1920x1080 --pos 3640x349 --rotate normal --output DisplayPort-2 --mode 1920x1080 --pos 1332x1609 --rotate inverted --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate right
###---Autostart---###
if ! pgrep -x "fcitx" > /dev/null ; then
	fcitx -d &
fi
#if ! pgrep -x "pcloud" > /dev/null ; then
#	pcloud &
#fi
if ! pgrep -x "pamac" > /dev/null ; then
	pamac-daemon; pamac-tray &
fi
if ! pgrep -x "mullvad-vpn" > /dev/null ; then
	mullvad-vpn &
fi
if ! pgrep -x "mailnag" > /dev/null ; then
	mailnag &
fi
if ! pgrep -x "usb-watcher" > /dev/null ; then
	usb-watcher &
fi
kdeconnect-indicator &
vdirsyncer sync &
/usr/lib/pentablet/pentablet.sh &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

###---Customization---###
#kitty +kitten themes st &
sed 's/ctermbg=LightGrey/ctrembg=DarkGrey/' ~/.vimrc &
alias cmus='screen -q -r -D cmus || screen -S cmus $(which --skip-alias cmus)'
#export TERMINAL=alacritty &

##---Fix for Clion---###
wmname LG3D &

#touchegg &
dex -a -s /home/ki11errabbit/.config/autostart &
lock &
emacs --daemon &
###---Wallpaper---###
#feh --bg-fill /home/ki11errabbit/Pictures/Wallpapers/80075693_p0\ Crop\ Upscale.png

###---variable for dwmblocks---###
export WEATHER_OPTION=0 & #echo 0 > /tmp/weather_option
export SESSION=x &
