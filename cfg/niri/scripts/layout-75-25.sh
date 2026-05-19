#!/usr/bin/env bash
ACTIVE_WORKSPACE=$(niri msg --json workspaces | jq -r '.[] | select(.is_focused == true).id')
WINDOWS=$(niri msg --json windows | jq -r "[.[] | select(.workspace_id == $ACTIVE_WORKSPACE)]")
PRIMARY_WINDOW_ID=$(echo $WINDOWS | jq -r '.[] | select(.layout.pos_in_scrolling_layout[0] == 1).id')
SECONDARY_WINDOW_ID=$(echo $WINDOWS | jq -r '.[] | select(.layout.pos_in_scrolling_layout[0] == 2).id')

if [[ -z $PRIMARY_WINDOW_ID || -z $SECONDARY_WINDOW_ID ]]; then
  exit 0
fi

niri msg action set-window-width --id $PRIMARY_WINDOW_ID 75%
niri msg action set-window-height --id $PRIMARY_WINDOW_ID 100%
niri msg action set-window-width --id $SECONDARY_WINDOW_ID 25%
niri msg action set-window-height --id $SECONDARY_WINDOW_ID 100%
