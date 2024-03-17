source /etc/profile
#xhost +si:localuser:$USER
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export VIDEO="mpv"
#SHELL="zsh"
#export MULLVAD_SERVER=$(doas get-mullvad-server)

#export $(dbus-launch)
#eval $(dbus-launch --sh-syntax --exit-with-session)
#export $(dbus-launch)
#export MOZ_ENABLE_WAYLAND=0
export BEMENU_OPTS="--tb #282c34 --tf #51afef --nb #282c34 --nf #bbc2cf --sb #51afef --sf #444b59 --fb #282c34 --ff #bbc2cf --hb #51afef --hf #444b59 --ab #282c34 --af #bbc2cf"



#if command -v dbus-launch >/dev/null && test -z "${DBUS_SESSION_BUS_ADDRESS}"; then
#       eval $(dbus-launch --sh-syntax --exit-with-session)
#       #eval export $(dbus-launch)
#fi


#export PATH=$PATH:~/.zig/zig-linux-x86_64-0.12.0-dev.1390+94cee4fb2
#PLAN9=/usr/local/plan9 
#export PLAN9
#PATH=$PATH:$PLAN9/bin 
#export PATH
#export PATH=$PATH:$HOME/.roswell/bin
