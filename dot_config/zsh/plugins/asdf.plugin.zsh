#!/usr/bin/env zsh

if ! command -v asdf >/dev/null; then
  return
fi

source $(brew --prefix asdf)/libexec/asdf.sh
