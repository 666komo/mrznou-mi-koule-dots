#!/bin/bash

# Check if the VPN is already connected
if nmcli connection show --active | grep -q "profile-16"; then
    echo "VPN is already connected."
    exit 0
fi

# Attempt to connect to the VPN
echo "Connecting to VPN profile-16..."
nmcli connection up profile-16

# Check if the connection was successful
if [ $? -eq 0 ]; then
    echo "Successfully connected to VPN profile-16."
    exit 0
else
    echo "Failed to connect to VPN profile-16."
    exit 1
fi
