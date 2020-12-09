#!/bin/bash
# using openweather to get data

APIKEY="87f2bfc5bc1599546ca906b46224a667"
CITY_ID="aachen"

URL="http://api.openweathermap.org/data/2.5/weather?q=${CITY_ID}&units=metric&APPID=${APIKEY}"

RESPONSE="`wget -qO- $URL`"

CONDITION=$(echo $RESPONSE | jq .'weather[0].main' | sed 's/"//g')
TEMP=$(echo $RESPONSE | jq .'main.temp')

TEMP_ROUNDED_DOWN=$(printf "%.1f\n" $TEMP | sed 's/,/./g')

SUN_ICON=
CLOUD_ICON=
CLOUD_SHOWER_ICON=

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
	'*')
		WEATHER_ICON="?"
		;;
esac

echo "$WEATHER_ICON $TEMP_ROUNDED_DOWN°C"


#echo $CONDITION
#echo $TEMP $TEMP_ROUNDED


#echo $RESPONSE
