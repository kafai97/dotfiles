#!/usr/bin/env zsh

if command -v rtx &>/dev/null; then
  echo "Installing packages with rtx"
  cd $HOME && rtx install || true
else
  echo "Missing rtx. Skipping asdf install"
fi
