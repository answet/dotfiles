#!/bin/bash

HEADPHONES="alsa_output.usb-Logitech_PRO_000000000000-00.analog-stereo"
MONITOR="alsa_output.pci-0000_08_00.1.hdmi-stereo"

COLOR_PRIMARY="#8FBCBB"
COLOR_SECUNDARY="#2a2e38"

CURRENT_SINK=$(pactl get-default-sink)

if (($1 == 1)); then
    if [ "$CURRENT_SINK" == "$HEADPHONES" ]; then
        {
            pactl set-default-sink "$MONITOR"
        }
    else
        {
            pactl set-default-sink "$HEADPHONES"
        }
    fi
fi

if [ "$CURRENT_SINK" == "$HEADPHONES" ]; then
    echo "%{F${COLOR_PRIMARY}}%{F-} %{F${COLOR_SECUNDARY}}󰍹%{F-}"
else
    echo "%{F${COLOR_SECUNDARY}}%{F-} %{F${COLOR_PRIMARY}}󰍹%{F-}"
fi
