#!/usr/bin/env zsh

LOCAL_BIN=$HOME/.local/bin

if command -v corepack &>/dev/null; then
  echo "setting up yarn with corepack"
  corepack enable --install-directory $LOCAL_BIN yarn
  corepack prepare yarn@1.22.17 --activate
else
  echo "Missing corepack. Skipping yarn setup"
fi
