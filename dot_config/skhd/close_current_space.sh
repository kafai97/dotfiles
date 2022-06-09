#!/usr/bin/env bash

index=$(yabai -m query --spaces --space | jq .index)

osascript -e \
  "tell application \"System Events\"
    do shell script quoted form of \"/System/Applications/Mission Control.app/Contents/MacOS/Mission Control\"
    delay 0.3
    perform action \"AXRemoveDesktop\" of button $index of list 1 of group \"Spaces Bar\" of group 1 of group \"Mission Control\" of process \"Dock\"
    delay 0.3
    do shell script quoted form of \"/System/Applications/Mission Control.app/Contents/MacOS/Mission Control\"
    delay 0.5
    key code 53
  end tell"
