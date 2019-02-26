#! /usr/bin/env bash

# get user option
options=' reboot\n shutdown\n suspend\n logout'
selected=$(echo -e $options | rofi -dmenu \
  -no-custom -lines 4 -width 10 -line-padding 10)

# execute
case $selected in
  " reboot") systemctl reboot;;
  " shutdown") systemctl poweroff;;
  " suspend") systemctl suspend;;
  " logout") i3-msg exit;;
esac
