#!/bin/bash

# Replace with your phone's Bluetooth MAC address
MAC_ADDRESS="CC:42:10:27:31:9C"

while true; do
    # Check if the device is connected
    bluetoothctl info "$MAC_ADDRESS" | grep "Connected: yes" > /dev/null
    if [ $? -ne 0 ]; then
        # If disconnected, lock the screen
        hyprlock
    fi
    # Check every 10 seconds
    sleep 10
done

