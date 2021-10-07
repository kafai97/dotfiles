#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title restore
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName dotfiles
# @raycast.currentDirectoryPath ~/.dotfiles

# Documentation:
# @raycast.description apply settings from dotfiles
# @raycast.author Fai
# @raycast.authorURL https://github.com/kafai97

set -xuo

xcode-select --install

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ ! -d $HOME/.oh-my-zsh ]; then
  echo "Installing Oh My Zsh"
  sh -c $(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)
fi

if [ ! -f $HOME/.mackup.cfg ]; then
  cp ./Mackup/.mackup.cfg $HOME/.mackup.cfg
  cp -r ./Mackup/.mackup $HOME/.mackup
fi

if [ ! -d $HOME/.mackup ]; then
  cp -r ./Mackup/.mackup $HOME/.mackup
fi

defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\""
defaults write com.apple.screencapture "location" -string "~/Pictures" && killall SystemUIServer

defaults write com.apple.Finder "AppleShowAllFiles" -bool "true"
defaults write com.apple.finder "QuitMenuItem" -bool "true"
killall Finder

defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "orientation" -string "bottom"
defaults write com.apple.dock "tilesize" -int "48"
defaults write com.apple.dock "mru-spaces" -bool "false"
killall Dock

brew bundle --cleanup --file $HOME/.dotfiles/Brewfile --no-lock

mackup restore -f

git submodule init
git submodule update --remote

for package in $(cat $HOME/.dotfiles/asdf.txt); do asdf plugin-add "${package}"; done

asdf plugin-update --all

asdf install

for package in $(cat $HOME/.dotfiles/pipx.txt); do pipx install "${package}"; done

sh $HOME/.dotfiles/scripts/install_extra.sh
