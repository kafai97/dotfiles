#!/usr/bin/env zsh

if command -v pip &>/dev/null; then
  if command -v deactivate &>/dev/null; then
    deactivate
  fi

  echo "addn neovim python support"
  pip install --user pynvim
fi

if command -v npm &>/dev/null; then
  echo "add neovim nodejs support"
  npm install -g neovim || true
fi
