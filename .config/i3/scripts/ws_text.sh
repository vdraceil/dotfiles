#! /usr/bin/env bash

WS4="4: text"
I3_WS_LAYOUT="$HOME/.config/i3/layouts/ws_text.json"

# kill all windows in text
i3-msg -q "[workspace=\"$WS4\"] kill"

# push new layout
i3-msg -q "workspace \"$WS4\"; append_layout $I3_WS_LAYOUT"

# start applications to be absorbed into the placeholders
(vscodium &)
(skypeforlinux &)
