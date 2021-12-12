#!/usr/bin/env bash

# Ref: https://github.com/adi1090x/rofi/blob/master/1080p/applets/menu/powermenu.sh

ROFI_CONFIG_DIR="$HOME/.config/rofi"

rofi_power_menu="rofi -theme $ROFI_CONFIG_DIR/powermenu.rasi"
confirm_theme="$ROFI_CONFIG_DIR/launcher.rasi"
message_theme="$ROFI_CONFIG_DIR/message.rasi"

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Confirmation
confirm_exit() {
  rofi -dmenu -i -no-fixed-num-lines -theme $confirm_theme -p "Are You Sure?"
}

# Message
show_options() {
  rofi -dmenu -i -no-fixed-num-lines -theme $message_theme -p "Available Options: yes, y, no, n"
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_power_menu -dmenu -selected-row 2)"
case $chosen in
  $shutdown)
    ans=$(confirm_exit &)
    if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
      systemctl poweroff
    elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
      exit 0
    else
      show_options
    fi
  ;;
  $reboot)
    ans=$(confirm_exit &)
    if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
      systemctl reboot
    elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
      exit 0
    else
      show_options
    fi
  ;;
  $lock)
    if [[ -f /usr/bin/betterlockscreen ]]; then
      betterlockscreen --lock dim
    elif [[ -f /usr/bin/i3lock ]]; then
      i3lock
    fi
  ;;
  $suspend)
    ans=$(confirm_exit &)
    if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
      mpc -q pause
      amixer set Master mute
      systemctl suspend
    elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
      exit 0
    else
      show_options
    fi
  ;;
    $logout)
    ans=$(confirm_exit &)
    if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
      if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
        openbox --exit
      elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
        bspc quit
      elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
        i3-msg exit
      fi
    elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
      exit 0
    else
      show_options
    fi
  ;;
esac
