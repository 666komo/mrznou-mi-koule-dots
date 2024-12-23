#!/bin/bash

# Check if Do Not Disturb is enabled
if dunstctl is-paused | grep -q "true"; then
    # DND is active, show enabled status
    echo "󰍶" # DND enabled icon
    echo "Enabled"
else
    # DND is not active, show disabled status
    echo "󰍶" # DND disabled icon
    echo "Disabled"
fi
