#!/usr/bin/env zsh

if command -v duti &>/dev/null; then
  echo "Set default uti with duti"
  duti $XDG_CONFIG_HOME/duti/config.duti || true
fi
