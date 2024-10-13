#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title toggle function keys
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🔧

# Documentation:
# @raycast.description toggle function keys
# @raycast.author kafai-lam
# @raycast.authorURL https://raycast.com/kafai-lam

toggle_function_keys() {
    local current_state=$(defaults read -g com.apple.keyboard.fnState)

    if [ "$current_state" = 0 ]; then
        echo "Enabling function keys as standard function keys..."
        defaults write -g com.apple.keyboard.fnState -bool true
    else
        echo "Disabling function keys and using them for system functions..."
        defaults write -g com.apple.keyboard.fnState -bool false
    fi
}

toggle_function_keys
