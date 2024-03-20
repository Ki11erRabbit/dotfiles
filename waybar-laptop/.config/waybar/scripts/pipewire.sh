#!/bin/sh


[ $(pamixer --get-mute) = true ] && echo "🔇 " && exit

vol="$(pamixer --get-volume)"

if [ "$vol" -gt "99" ]; then
	icon="🔊"
elif [ "$vol" -gt "70" ]; then
	icon="🔊 "
elif [ "$vol" -gt "30" ]; then
	icon="🔉 "
elif [ "$vol" -gt "9" ]; then
	icon="🔉 "
elif [ "$vol" -gt "0" ]; then
	icon="🔈  "
else
        echo " 🔇  $vol%" && exit
fi

echo "$icon$vol%"
