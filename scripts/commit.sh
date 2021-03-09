#!/usr/bin/env bash
set -xuo

cd $HOME/.dotfiles

sh ./scripts/backup.sh

git commit -am "regular update [$(date -u +%FT%TZ)]"
