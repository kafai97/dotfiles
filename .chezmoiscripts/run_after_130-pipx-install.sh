#!/usr/bin/env zsh

if command -v pip &>/dev/null; then
  if command -v deactivate &>/dev/null; then
    deactivate
  fi

  echo "install pipx"
  pip install --user pipx
fi

packages=(
  azure-cli
  # commitizen
  # cookiecutter
  # databricks-cli
  # streamlit
)

if command -v pipx &>/dev/null; then
  echo "Installing pipx packages"
  for package in $packages; do
    pipx install "$package"
  done
fi
