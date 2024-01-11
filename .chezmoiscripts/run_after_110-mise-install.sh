#!/usr/bin/env zsh

if command -v mise &>/dev/null; then
  echo "Installing packages with mise"
  cd $HOME && mise install || true
else
  echo "Missing mise. Skipping mise install"
fi
