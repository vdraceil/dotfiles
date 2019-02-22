WS1="1: dashboard"
I3_WS_LAYOUT="$HOME/.config/i3/layouts/ws_dashboard.json"

# kill all windows in dashboard
i3-msg -q "[workspace=\"$WS1\"] kill"

# push new layout
i3-msg -q "workspace \"$WS1\"; append_layout $I3_WS_LAYOUT"

# start applications to be absorbed into the placeholders
(urxvt -e ranger "$HOME/Downloads" &)
(urxvt -e bc &)
(urxvt -e ncmpcpp -s visualizer &)
(urxvt -T tty-clock -e sh -c "tty-clock -sb -C 1" &)

# focus main window - ranger
i3-msg -q "workspace \"$WS1\"; [title="ranger"] focus"
