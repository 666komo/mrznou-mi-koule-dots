#!/bin/bash

# Function to get the list of applications
get_apps() {
    find /usr/share/applications -name "*.desktop" | xargs grep -h "^Name=" | cut -d= -f2 | sort -u
}

# Function to launch the selected application
launch_app() {
    selected_app="$1"
    desktop_file=$(grep -l "^Name=$selected_app" /usr/share/applications/*.desktop | head -n 1)
    if [ -n "$desktop_file" ]; then
        exec=$(grep "^Exec=" "$desktop_file" | cut -d= -f2 | sed 's/%[fFuU]//g')
        nohup $exec >/dev/null 2>&1 &
    fi
}

# Main script
if [ "$1" = "list" ]; then
    get_apps
elif [ "$1" = "run" ]; then
    launch_app "$2"
else
    echo "Usage: $0 [list|run <app_name>]"
    exit 1
fi
