#!/usr/bin/env zsh

BIN_DIR=$HOME/bin

[[ -d $BIN_DIR ]] || mkdir -p $BIN_DIR

if command -v corepack &>/dev/null; then
  echo "setting up yarn with corepack"
  corepack prepare yarn@1.22.18 --activate
  corepack enable --install-directory $BIN_DIR yarn
else
  echo "Missing corepack. Skipping yarn setup"
fi
