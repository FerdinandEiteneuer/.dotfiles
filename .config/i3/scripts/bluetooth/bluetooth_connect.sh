#!/bin/bash

# connect to bluetooth device
#
# the script is trying to do two things:
# 1:
#	if we are connected to the device, disconnect
# 2:
#	if we are not connected to the device, disconnect any
# 	potential connection and connect to the device

DEVICE=$1

if [ -z "$DEVICE" ]
then
	echo "No Device MAC ID was given"
	exit
fi

HEADSET="38:18:4C:24:E6:B5"


# if disconnected == "1" there is no connection to the headset
DISCONNECTED=$(bluetoothctl info $DEVICE | grep "Connected: no" | wc -l)


# if no device is connected, this returns with status 1 instantly
# if we are connected to any other device, we cut the connection
bluetoothctl disconnect

if [ $DISCONNECTED = "1" ]
then
	# if we were disconnected at the start of the script
	# we want to connect now	
	bluetoothctl connect $DEVICE
else
	echo 	
	# if we arrive here we wanted to disconnect
	# this has already happene
fi
