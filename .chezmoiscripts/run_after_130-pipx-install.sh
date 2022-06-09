#!/usr/bin/env zsh

packages=(
  azure-cli
  black
  # commitizen
  django
  # cookiecutter
  # databricks-cli
  # streamlit
  xxh-xxh
)

if command -v pipx &>/dev/null; then
  echo "Installing pipx packages"
  for package in $packages; do
    pipx install "$package"
  done
fi
