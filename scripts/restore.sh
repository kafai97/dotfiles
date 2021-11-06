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

git -C $HOME/.dotfiles submodule init
git -C $HOME/dotfiles submodule update --remote

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v hermit &>/dev/null; then
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

brew bundle --cleanup --file $HOME/.dotfiles/Brewfile --no-lock

mackup restore -f

for package in $(cat $HOME/.dotfiles/asdf.txt); do asdf plugin-add "${package}"; done

asdf plugin-update --all

asdf install

for package in $(cat $HOME/.dotfiles/pipx.txt); do pipx install "${package}"; done

BIN_DIR=$HOME/.local/bin

if ! command -v hermit &>/dev/null; then
  curl -fsSL https://github.com/cashapp/hermit/releases/download/stable/install.sh | HERMIT_BIN_INSTALL_DIR=$BIN_DIR sh
fi

if ! command -v dapr &>/dev/null; then
  curl -fsSL https://raw.githubusercontent.com/dapr/cli/master/install/install.sh | DAPR_INSTALL_DIR=$BIN_DIR sh
fi

if ! command -v hasura &>/dev/null; then
  curl -fsSL https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | INSTALL_PATH=$BIN_DIR sh
fi

if ! command -v kool &>/dev/null; then
  curl -fsSL https://kool.dev/install | BIN_PATH=$BIN_DIR/kool sh
fi

if ! command -v kubectl-crossplane &>/dev/null; then
  cd $BIN_DIR
  curl -fsSL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh
fi

if command -v corepack &>/dev/null; then
  corepack enable --install-directory $BIN_DIR pnpm yarn
  corepack prepare yarn@1.22.17 --activate
  corepack prepare pnpm@6.20.2 --activate
fi
