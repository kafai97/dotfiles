#!/usr/bin/env zsh

if command -v mise &>/dev/null; then
  echo "Installing packages with mise"
  mise install --cd $HOME || true
else
  echo "Missing mise. Skipping mise install"
fi
