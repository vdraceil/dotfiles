#! /usr/bin/env bash

WS_DOWNLOADS_DIR="$HOME/local/downloads"

WS1="1: dashboard"
I3_WS_LAYOUT="$HOME/.config/i3/layouts/ws_dashboard.json"

# kill all windows in dashboard
i3-msg -q "[workspace=\"$WS1\"] kill"

# push new layout
i3-msg -q "workspace \"$WS1\"; append_layout $I3_WS_LAYOUT"

# start applications to be absorbed into the placeholders
(alacritty -t ranger -e ranger "$WS_DOWNLOADS_DIR" &)
(BC_ENV_ARGS=<(echo "scale=2") alacritty -t bc -e bc &)
(alacritty -t cal --hold -e sh -c "cal -n 2" &)

# focus workspace and main window - ranger
sleep 0.5
i3-msg -q "workspace \"$WS1\"; [title=\"ranger\"] focus"
