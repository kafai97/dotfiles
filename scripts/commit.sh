#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title push changes
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName dotfiles
# @raycast.currentDirectoryPath ~/.dotfiles

# Documentation:
# @raycast.description push commits to dotfiles
# @raycast.author Fai
# @raycast.authorURL https://github.com/kafai97

set -xuo

cd $HOME/.dotfiles

sh ./scripts/backup.sh

git commit -am "regular update [$(date -u +%FT%TZ)]"

git push origin master
