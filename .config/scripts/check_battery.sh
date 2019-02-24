#! /usr/bin/env bash

CRITICAL_BATTERY_PERCENT=10

BATTERY_PERCENT=$(acpi -b | grep -oP '(?<=Discharging, )\d+(?=%)')
if [ "$BATTERY_PERCENT" -lt "$CRITICAL_BATTERY_PERCENT" ]
then
    DISPLAY=:0 notify-send -u critical \
      "Battery Low" "Remaining: ${BATTERY_PERCENT}%"
fi
