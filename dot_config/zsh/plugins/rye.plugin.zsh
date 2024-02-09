#!/usr/bin/env zsh

if ! command -v rye >/dev/null; then
  return
fi

path+=(
  $HOME/.rye/shims
)

source <(rye self completion)
