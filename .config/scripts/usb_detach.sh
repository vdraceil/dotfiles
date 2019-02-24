#! /usr/bin/env bash

mountedUSBMedia=$(mount | grep -oP '/run/media/[^ ]+')
if [ -n "$mountedUSBMedia" ]
then
    selected=$(echo -e "$mountedUSBMedia" | rofi -dmenu -p \
        "USB Device to Detach" -i -no-custom)
    [ -n "$selected" ] && udiskie-umount --detach "$selected"
    exit 0
else
  notify-send -u low "No Action" "No USB Device mounted"
fi
