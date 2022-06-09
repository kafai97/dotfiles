#!/usr/bin/env bash

# mime=$(file -bL --mime-type "$1")
# category=${mime%%/*}
# kind=${mime##*/}

if [ -d "$1" ]; then
  exa --long --all --git --sort=type --icons --color=always $1
else
  bat --color=always $1
fi
