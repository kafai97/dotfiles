#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title toggle fnlock
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Developer Utils

# Documentation:
# @raycast.description toggle fnlock
# @raycast.author Fai
# @raycast.authorURL https://github.com/kafai97

fnlock=$(defaults read -g com.apple.keyboard.fnState)
echo $fnlock
if [[ $fnlock = 1 ]]; then
  defaults write -g com.apple.keyboard.fnState -bool false
  echo fnlock is off
else
  defaults write -g com.apple.keyboard.fnState -bool true
  echo fnlock is on
fi
