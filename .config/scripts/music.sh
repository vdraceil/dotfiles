#! /usr/bin/env bash

radio="$HOME/.config/scripts/radio.sh"

case "$1" in
  toggle)
    $radio is-active
    if [ $? -eq 0 ]; then
      # stop radio and start mpd
      $radio stop
      sleep 2
      mpc play
    else
      # stop mpd and start radio
      mpc stop
      $radio play
    fi
    ;;
  next)
    $radio next || mpc next
    ;;
  prev)
    $radio prev || mpc prev
    ;;
  play-toggle)
    if [[ $(mpc current) == "" ]]; then
      # mpc is inactive
      $radio toggle
    else
      # mpc is active
      mpc toggle
    fi
    ;;
  *)
    echo 'music.sh: unknown command'
    exit 1
esac
