#!/bin/bash
sleep 1
systemctl --user stop xdg-desktop-portal &
systemctl --user stop xdg-desktop-portal-gtk &
systemctl --user stop xdg-desktop-portal-wlr &
systemctl --user restart dbus &
systemctl --user start xdg-desktop-portal-hyprland &
