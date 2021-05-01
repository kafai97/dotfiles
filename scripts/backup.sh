#!/usr/bin/env bash
set -xuo

cd $HOME/.dotfiles

brew bundle dump --describe --force

asdf plugin-list | tee $HOME/.dotfiles/asdf.txt

/bin/ls -1 ~/.local/pipx/venvs | tee $HOME/.dotfiles/pipx.txt

git submodule update --remote

mackup backup -f
