#!/usr/bin/env zsh

if ! command -v pack >/dev/null; then
  return
fi

source $(pack completion --shell zsh)
