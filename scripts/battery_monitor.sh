#! /bin/bash
#
# Script to monitor battery charge, and notify when full or low
 
while true
do
    state=` acpi | awk '{print $3}'`
    charge=`acpi | grep -P -o '[0-9]+(?=%)'`        

    if [ $state = "Discharging," ] 
    then
        if [ $charge -le 20 ] 
        then
            notify-send "Battery low, ${charge}% remaining"
        fi
    else
        if [ $state = "Full," ] 
        then
            notify-send "Battery Full"
        fi
    fi
    sleep 180
done

