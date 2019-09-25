#!/bin/bash

id=$(xinput | grep "SynPS/2 Synaptics TouchPad" | grep -E -o "id=[[:digit:]]+" | grep -E -o "[[:digit:]]+")

if [ "$id" = "" ]
then
    echo "no touchpad found."
    exit 0
fi

status=$(xinput list-props $id | grep "Device Enabled" | cut -f3)

if [ $status -eq 0 ]
then
    xinput set-prop $id "Device Enabled" 1
    echo "enabling device $id"
else
    xinput set-prop $id "Device Enabled" 0
    echo "disabling device $id"
fi

