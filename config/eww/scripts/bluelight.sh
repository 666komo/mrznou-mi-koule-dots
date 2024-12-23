#!/bin/bash

# Check if gammastep is running
if pgrep -x "gammastep" > /dev/null; then
    # Blue light filter is active, disable it
    pkill gammastep
    echo "󰃟" # Blue light filter disabled icon
    echo "Disabled"
else
    # Blue light filter is not active, enable it
    gammastep -O 4500 &
    echo "󰃠" # Blue light filter enabled icon  
    echo "Enabled"
fi
