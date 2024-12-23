#!/bin/bash

# Check if WiFi is enabled
wifi_enabled=$(nmcli radio wifi)

# Get connection info
connection_info=$(nmcli -t -f TYPE,STATE connection show --active)

if echo "$connection_info" | grep -q "ethernet:activated"; then
    echo "󰈀" # Wired icon
    echo "Wired"
elif [ "$wifi_enabled" = "enabled" ] && echo "$connection_info" | grep -q "wireless:activated"; then
    # Get WiFi signal strength
    signal_strength=$(nmcli -f IN-USE,SIGNAL device wifi | grep "^*" | awk '{print $2}')
    
    if [ "$signal_strength" -ge 75 ]; then
        echo "󰤨" # Full signal
    elif [ "$signal_strength" -ge 50 ]; then
        echo "󰤥" # Good signal
    elif [ "$signal_strength" -ge 25 ]; then
        echo "󰤢" # Fair signal
    else
        echo "󰤟" # Poor signal
    fi
    echo "WiFi"
else
    echo "󰤭" # Disconnected icon
    echo "Disconnected"
fi
