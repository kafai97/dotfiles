#!/usr/bin/env zsh

if command -v stew &>/dev/null; then
  echo "Installing binaries with stew"
  stew install $XDG_DATA_HOME/stew/Stewfile.lock.json || true
fi
