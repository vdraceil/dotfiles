#! /usr/bin/env bash

SELF="$HOME/.config/scripts/radio.sh"

PLAYLIST="$HOME/Coffee/Music/Chennai-Radio.m3u"
SOCKET="/tmp/mpvsocket"

USER_AGENT="Mozilla/5.0 (X11; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0"
REFERER="http://www.tamilradios.com/embed/index.php"

case "$1" in
  play)
    mpv --user-agent=$USER_AGENT --referrer=$REFERER \
      --playlist=$PLAYLIST --loop-playlist \
      --input-ipc-server=$SOCKET --really-quiet &
    ;;
  pause|stop|quit)
    echo 'quit' | socat - $SOCKET
    ;;
  toggle)
    $SELF is-active && $SELF stop || $SELF play
    ;;
  next)
    echo 'playlist-next' | socat - $SOCKET
    ;;
  prev)
    echo 'playlist-prev' | socat - $SOCKET
    ;;
  print-title)
    echo '{"command": ["get_property_string","media-title"]}' |
      socat - $SOCKET | jq -r .data
    ;;
  is-active)
    echo 'show-text test' | socat - $SOCKET >/dev/null 2>&1
    [ $? -eq 0 ]
    ;;
  *)
    echo 'radio.sh: unknown command'
    exit 1
esac
