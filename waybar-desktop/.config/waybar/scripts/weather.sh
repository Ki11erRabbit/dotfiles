#!/bin/sh

# Displays todays precipication chance (☔) and daily low (🥶) and high (🌞).
# Usually intended for the statusbar.

# If we have internet, get a weather report from wttr.in and store it locally.
# You could set up a shell alias to view the full file in a pager in the
# terminal if desired. This function will only be run once a day when needed.
weatherreport="${XDG_DATA_HOME:-$HOME/.local/dashare}/weatherreport"
getforecast() { curl -sf "wttr.in/$LOCATION" > "$weatherreport" || exit 1 ;}
currweather=$(curl -sf "wttr.in/$LOCATION?format=%c%t+%h\n")
# | sed 's/ //')
#weather_option=$(cat ~/.dwm/blocks-scripts/helper-scripts/weather_option)
if [ -z $WEATHER_OPTION ]; then
	export WEATHER_OPTION=0
fi
# Some very particular and terse stream manipulation. We get the maximum
# precipitation chance and the daily high and low from the downloaded file and
# display them with coresponding emojis.
showweather() { printf "%s" "$(sed '16q;d' "$weatherreport" |
	grep -wo "[0-9]*%" | sort -rn | sed "s/^/☔/g;1q" | tr -d '\n')"
sed '13q;d' "$weatherreport" | grep -o "m\\([-+]\\)*[0-9]\\+" | sed 's/+//g' | sort -n -t 'm' -k 2n | sed -e 1b -e '$!d' | tr '\n|m' ' ' | awk '{print " 🥶" $1 "°","🌞" $2 "°"}' ;}


# The test if our forcecast is updated to the day. If it isn't download a new
# weather report from wttr.in with the above function.
[ "$(stat -c %y "$weatherreport" 2>/dev/null | cut -d' ' -f1)" = "$(date '+%Y-%m-%d')" ] ||
	getforecast

case $1 in
	1) getforecast
	   echo "$(showweather) "
	   export WEATHER_OPTION=0 #echo 0 > /tmp/weather_option
	   ;;
	0) echo "$currweather ";;
esac

#echo 0 > ~/.dwm/blocks-scripts/helper-scripts/weather_option

