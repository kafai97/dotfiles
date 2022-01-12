#!/usr/bin/env zsh

if command -v asdf &>/dev/null; then
  echo "Installing packages with asdf"
  file=~/.tool-versions
  packages=($(cut -d" " -f1 $file))
  for package in $packages; do
    asdf plugin add $package
  done
  asdf install
else
  echo "Missing asdf. Skipping asdf install"
fi
