#!/usr/bin/env bash

# Env var

QT_QPA_PLATFORM="${QT_QPA_PLATFORM:-wayland;xcb}"                               # Qt: Use wayland if available, fall back to x11 if not.
QT_AUTO_SCREEN_SCALE_FACTOR="${QT_AUTO_SCREEN_SCALE_FACTOR:-1}"                 # Enables automatic scaling, based on the monitor’s pixel density
QT_WAYLAND_DISABLE_WINDOWDECORATION="${QT_WAYLAND_DISABLE_WINDOWDECORATION:-1}" # Disables window decorations on Qt applications
QT_QPA_PLATFORMTHEME="${QT_QPA_PLATFORMTHEME:-qt6ct}"                           # Tells Qt based applications to pick your theme from qt5ct, use with Kvantum.
GTK_USE_PORTAL="1"

export QT_QPA_PLATFORM QT_AUTO_SCREEN_SCALE_FACTOR QT_WAYLAND_DISABLE_WINDOWDECORATION QT_QPA_PLATFORMTHEME GTK_USE_PORTAL
