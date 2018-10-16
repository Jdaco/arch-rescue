#!/bin/bash

declare -i charge=$(cat /sys/class/power_supply/BAT?/capacity)
if [[ $charge -lt 10 && $(cat /sys/class/power_supply/BAT0/status) != "Charging" ]]; then
    echo -n mem > /sys/power/state
fi
