#!/usr/bin/env zsh

if command -v cargo &>/dev/null; then
  echo "Installing packages with cargo"
  if ! command -v joshuto &>/dev/null; then
    echo "Installing joshuto with cargo"
    cargo install --git https://github.com/kamiyaa/joshuto.git --all-features || true
  fi
fi
