#!/bin/sh

# Function to enable/disable eDP-1 based on monitor count
callback() {
	monitor_count=$(hyprctl monitors | grep -c " (ID [0-9]):")
	if ( ($monitor_count -gt 1)); then
		hyprctl keyword monitor eDP-1,disable # Disable eDP-1 when HDMI is connected
	else
		hyprctl keyword monitor eDP-1,preferred,0x0,1 # Re-enable eDP-1 when HDMI is disconnected
	fi
}

# Handle Hyprland events (monitor added/removed)
handle() {
	case $1 in
	monitoradded* | monitorremoved*) callback ;;
	esac
}

# Start IPC listener
socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do handle "$line"; done
