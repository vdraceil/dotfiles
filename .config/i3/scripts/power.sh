#! /bin/bash

# get user option
options='reboot\nshutdown\nsuspend\nlogout'
selected=$(echo -e $options | rofi -dmenu -no-custom)

# execute
case $selected in
  "reboot") systemctl reboot;;
  "shutdown") systemctl poweroff;;
  "suspend") systemctl suspend;;
  "logout") i3-msg exit;;
esac
