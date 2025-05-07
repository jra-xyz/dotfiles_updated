#!/usr/bin/env bash

CURRENTWS="/tmp/workspaceFIFO"

if [[ ! -p "$CURRENTWS"]]; then
  mkfifo "$CURRENTWS"
fi

handle() {
  case $1 in
    focusedmon*)
        workspace_name=$(echo "$line" | jq -r '.workspace.name')
        truncate -s 0 "$CURRENTWS"
        echo "$workspace_name" > "$CURRENTWS"
        ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
