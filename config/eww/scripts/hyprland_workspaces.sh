#!/bin/bash

# Define icons for workspaces 1-9
ic_empty=""
ic_occupied=""
ic_active=""

# Define icon text names for workspaces 1-9
icon_names=("" "" "" "" "" "" "" "" "")

generate_workspace_json() {
    # Get all workspaces
    all_workspaces=$(seq 1 9)

    # Get occupied workspaces and remove workspace -99 aka scratchpad if it exists
    occupied_workspaces=$(hyprctl workspaces -j | jq '.[] | del(select(.id == -99)) | .id')

    # Get active workspace
    active_workspace=$(hyprctl activeworkspace -j | jq '.id')

    # Build JSON array
    json="["
    for num in $all_workspaces; do
        if [[ $active_workspace == $num ]]; then
            icon=$ic_active
            class="active"
        elif [[ $occupied_workspaces == *"$num"* ]]; then
            icon=$ic_occupied
            class="occupied"
        else
            icon=$ic_empty
            class="empty"
        fi
        
        json+=$(printf '{"id":%d,"icon":"%s","name":"%s","class":"%s"},' $num "$icon" "${icon_names[$((num-1))]}" "$class")
    done
    json="${json%,}]"  # Remove trailing comma and close array
    echo "$json"
}

last_json=""

update_workspaces() {
    current_json=$(generate_workspace_json)
    if [[ "$current_json" != "$last_json" ]]; then
        echo "$current_json"
        last_json="$current_json"
    fi
}

update_workspaces
socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r; do 
    update_workspaces
done
