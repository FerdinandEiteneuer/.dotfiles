#!/bin/bash
# using openweather to get data

APIKEY="87f2bfc5bc1599546ca906b46224a667"

#CITY_ID="aachen"

# get my location based on IP

PUBLIC_IP=$(curl -s "https://ipinfo.io/ip")  # public ip
CITY_ID=$(curl -s "https://tools.keycdn.com/geo.json?host=$PUBLIC_IP" | jq .data.geo.city | sed 's/"//g')  # lookup location based on ip

URL="http://api.openweathermap.org/data/2.5/weather?q=${CITY_ID}&units=metric&APPID=${APIKEY}"

RESPONSE="`wget -qO- $URL`"

CONDITION=$(echo $RESPONSE | jq .'weather[0].main' | sed 's/"//g')
TEMP=$(echo $RESPONSE | jq .'main.temp')

TEMP_ROUNDED=$(printf "%.1f\n" $TEMP | sed 's/,/./g')

SUN_ICON=
CLOUD_ICON=
CLOUD_SHOWER_ICON=
SNOW_ICON=

case $CONDITION in
	'Clear')
		WEATHER_ICON=$SUN_ICON
		;;
	'Rain')
		WEATHER_ICON=$CLOUD_SHOWER_ICON
		;;
	'Clouds')
		WEATHER_ICON=$CLOUD_ICON
		;;
	'Snow')
		WEATHER_ICON=$SNOW_ICON
		;;
	'*')
		WEATHER_ICON=""
		;;
esac

echo "$WEATHER_ICON $TEMP_ROUNDED°C"


#echo $CONDITION
#echo $TEMP $TEMP_ROUNDED


#echo $RESPONSE
