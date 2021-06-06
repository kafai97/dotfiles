#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title backup
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName dotfiles
# @raycast.currentDirectoryPath ~/.dotfiles

# Documentation:
# @raycast.description backup settings to dotfiles
# @raycast.author Fai
# @raycast.authorURL https://github.com/kafai97

set -xuo

cd $HOME/.dotfiles

brew bundle dump --describe --force

asdf plugin-list | tee $HOME/.dotfiles/asdf.txt

/bin/ls -1 ~/.local/pipx/venvs | tee $HOME/.dotfiles/pipx.txt

git submodule update --remote

mackup backup -f
