#!/usr/bin/env zsh

if ! command -v rye >/dev/null; then
  return
fi

source "$HOME/.rye/env"
source <(rye self completion)
