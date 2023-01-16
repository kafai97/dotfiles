#!/usr/bin/env zsh

packages=(
  azure-cli
  black
  commitizen
  # cookiecutter
  copier
  cruft
  # databricks-cli
  django
  flake8
  gitman
  isort
  oca-maintainers-tools
  pre-commit
  pylint
  revup
  # streamlit
  # xxh-xxh
)

if command -v pipx &>/dev/null; then
  echo "Installing pipx packages"
  for package in $packages; do
    pipx install "$package"
  done
fi
