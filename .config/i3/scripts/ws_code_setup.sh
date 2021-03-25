#! /usr/bin/env bash

WS_DIR=/work
WS_PERSONAL_DIR=$WS_DIR/personal
WS_FREELANCE_DIR=$WS_DIR/freelance

PANES_COUNT=$1
I3_WS_LAYOUT="$HOME/.config/i3/layouts/ws_code_${PANES_COUNT}panes.json"

# compile projects list, recently modified first
personalProjects=$(
  find $WS_PERSONAL_DIR -mindepth 1 -maxdepth 2 -type d -printf '%T@\t%p\n' |
  grep -vP 'env$' |
  cut -f2 |
  sed -n "s|${WS_PERSONAL_DIR}|\$WS_PERSONAL_DIR|p")
freelanceProjects=$(
  find $WS_FREELANCE_DIR -mindepth 2 -maxdepth 3 -type d -printf '%T@\t%p\n' |
  grep -vP '(node_modules|__pycache__|output|_ROUGH|env|.git$)' |
  cut -f2 |
  sed -n "s|${WS_FREELANCE_DIR}|\$WS_FREELANCE_DIR|p")
projects=("\$WS_PERSONAL_DIR" "${personalProjects[@]}"
  "\$WS_FREELANCE_DIR" "${freelanceProjects[@]}")

# select project
selectedProject=$(eval echo $(
  printf "%s\n" "${projects[@]}" | rofi -dmenu -i -no-custom))

# select workspace
workspaces="5: code|6: code|7: code|8|9|10"
selectedWorkspace=$(echo $workspaces | rofi -dmenu -sep '|' -i -no-custom)

# set up workspace
if [ -f "$I3_WS_LAYOUT" -a -n "$selectedProject" -a -n "$selectedWorkspace" ]
then
  # kill all windows in the selected workspace
  i3-msg -q "[workspace=\"$selectedWorkspace\"] kill"

  # push new layout
  i3-msg -q "workspace \"$selectedWorkspace\"; append_layout $I3_WS_LAYOUT"

  # start applications to be absorbed into the placeholders
  (urxvt -cd $selectedProject -e vim &)
  for (( i=1; i<$PANES_COUNT; i++ ))
  do
    (urxvt -cd $selectedProject &)
  done

  # focus main window - vim
  sleep 0.5
  i3-msg -q "workspace \"$selectedWorkspace\"; [title=\"vim\"] focus"
else
  exit 1
fi
