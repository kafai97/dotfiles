#!/usr/bin/env zsh

if ! command -v go >/dev/null; then
  return
fi

path+=(
  $(go env GOPATH)/bin
)
