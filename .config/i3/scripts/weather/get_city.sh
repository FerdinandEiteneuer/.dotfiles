PUBLIC_IP=$(wget -qO- "https://ipinfo.io/ip")  # public ip

LOCATION=$(curl -s "https://tools.keycdn.com/geo.json?host=$PUBLIC_IP" | jq .data.geo.city | sed 's/"//g')  # lookup location based on ip

LOCATION=${LOCATION,,} # to lower case

echo $LOCATION
#export MY_LOCATION="CITY"
#export MY_LOCATION=$LOCATION
