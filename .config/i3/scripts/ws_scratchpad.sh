#! /usr/bin/env bash

WS10="10: scratchpad"
I3_WS_LAYOUT="$HOME/.config/i3/layouts/ws_scratchpad.json"

# kill all windows in scratchpad
i3-msg -q "[workspace=\"$WS10\"] kill"

# push new layout
i3-msg -q "workspace \"$WS10\"; append_layout $I3_WS_LAYOUT"

# start applications to be absorbed into the placeholders
(alacritty -t scratchpad &)
