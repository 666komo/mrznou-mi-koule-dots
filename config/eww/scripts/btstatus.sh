#!/bin/bash

# Check if Bluetooth is enabled
bluetooth_enabled=$(bluetoothctl show | grep -q "Powered: yes" && echo "enabled" || echo "disabled")

# Get connection info
connected_devices=$(bluetoothctl devices Connected | wc -l)

if [ "$bluetooth_enabled" = "enabled" ]; then
    if [ "$connected_devices" -gt 0 ]; then
        echo "󰂱" # Connected icon
        echo "Connected"
    else
        echo "󰂯" # Enabled but not connected
        echo "On"
    fi
else
    echo "󰂲" # Disabled icon
    echo "Off"
fi
