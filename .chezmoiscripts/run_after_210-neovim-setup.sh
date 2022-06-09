#!/usr/bin/env zsh

if command -v pip &>/dev/null; then
  if command -v deactivate &>/dev/null; then
    deactivate
  fi

  echo "addn neovim python support"
  pip install --user pynvim
fi

if command -v yarn &>/dev/null; then
  echo "addn neovim nodejs support"
  yarn global add neovim
fi
