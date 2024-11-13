#!/usr/bin/env zsh

if command -v stew &>/dev/null; then
  echo "Installing binaries with stew"
  stew install $XDG_CONFIG_HOME/stew/Stewfile || true
fi
