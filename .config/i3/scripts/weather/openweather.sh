#!/bin/bash
# using openweather to get data

LC_CTYPE=en_US.utf8

APIKEY="APIKEY"


CITY_ID="BERLIN"

source ~/.config/i3/scripts/weather/get_city.sh

CITY_ID_=$MY_LOCATION

URL="http://api.openweathermap.org/data/2.5/weather?q=${CITY_ID}&units=metric&APPID=${APIKEY}"
URL_="http://api.openweathermap.org/data/2.5/weather?q=${CITY_ID_}&units=metric&APPID=${APIKEY}"

if [ $URL == $URL_ ]; then
	printf "${URL}\n${URL_}\n" > ~/.config/i3/scripts/weather/info.txt
	#echo "Strings are equal."
	:
else
	printf "A${CITY_ID_}\nB${CITY_ID}\n${URL}\n${URL_}\n not equal" > ~/.config/i3/scripts/weather/ne_info.txt
:
	#echo "$URL\n$URL2"
fi


#WEATHER_INFO=$(wget -qO- "${WEATHER_URL}")

RESPONSE="`wget -qO- $URL`"

CONDITION=$(echo $RESPONSE | jq .'weather[0].main' | sed 's/"//g')
TEMP="$(echo $RESPONSE | jq .'main.temp')"


WEATHER_TEMP=$(echo "${RESPONSE}" | grep -o -e '\"temp\":\-\?[0-9]*' | awk -F ':' '{print $2}' | tr -d '"')

TEMP_ROUNDED=$(printf "%.1f\n" $TEMP | sed 's/,/./g')
#TEMP_ROUNDED=$(LC_NUMERIC="en_US.UTF-8" printf "%.1f\n" $TEMP | sed 's/,/./g')


#SUN_ICON=
#CLOUD_ICON=
#CLOUD_SHOWER_ICON=
#SNOW_ICON=
SYMBOL_CELSIUS="°C"

ICON_SUNNY=""
ICON_CLOUDY=""
ICON_RAINY=""
ICON_STORM=""
ICON_SNOW=""
ICON_FOG=""


#WEATHER_ICON=$CLOUD_ICON

case $CONDITION in
	'Clear')
		WEATHER_ICON=$ICON_SUNNY
		;;
	'Rain')
		WEATHER_ICON=$ICON_RAINY
		;;
	'Clouds')
		WEATHER_ICON=$ICON_CLOUDY
		;;
	'Snow')
		WEATHER_ICON=$ICON_SNOW
		;;
	'*')
		WEATHER_ICON="?"
		;;
esac



:echo "${WEATHER_ICON} ${TEMP}${SYMBOL_CELSIUS}"
#echo "${WEATHER_ICON} ${TEMP_ROUNDED}${SYMBOL_CELSIUS}"

