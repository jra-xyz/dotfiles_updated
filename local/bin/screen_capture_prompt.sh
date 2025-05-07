#!/bin/bash

FILENAME="screenshot_$(date +%s).png"
FILEPATH="/tmp/$FILENAME"

# Region select
REGION=$(slurp)
[ -z "$REGION" ] && exit 1
grim -g "$REGION" "$FILEPATH"

# Choice prompt
CHOICE=$(zenity --list --title="What do you want to do?" \
  --column="Action" "Clipboard" "Save" "GPT")

case "$CHOICE" in
"Clipboard")
  wl-copy <"$FILEPATH"
  notify-send "Image copied to clipboard"
  ;;
"Save")
  mkdir -p ~/Screenshots
  cp "$FILEPATH" ~/Screenshots/"$FILENAME"
  notify-send "Saved to ~/Pictures/Screenshots/"
  ;;

"GPT")
  notify-send "Sending image to ChatGPT..."
  ~/.local/bin/send_to_gpt.py "$FILEPATH" &
  ;;

*)
  notify-send "No valid choice selected."
  ;;
esac
