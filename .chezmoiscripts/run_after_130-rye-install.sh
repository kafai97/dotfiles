#!/usr/bin/env zsh

if ! command -v rye &>/dev/null; then
  echo "Installing rye with eget"
  eget --to $HOME/bin/rye mitsuhiko/rye
fi

packages=(
  # apache-airflow
  azure-cli
  # commitizen
  # cookiecutter
  # copier
  # cruft
  # databricks-cli
  # django
  # gitman
  # gradio
  # huggingface-hub
  # oca-maintainers-tools@git+https://github.com/OCA/maintainer-tools.git
  # openapi-python-client
  # pgcli
  pip-deepfreeze
  # pip-tools
  # pre-commit
  # revup
  # streamlit
  # xxh-xxh
)

if command -v rye &>/dev/null; then
  echo "Installing global python binaries with rye"
  for package in $packages; do
    rye tools install "$package" || true
  done
fi
