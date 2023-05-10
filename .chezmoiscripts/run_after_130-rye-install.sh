#!/usr/bin/env zsh

packages=(
  # apache-airflow
  # azure-cli
  # commitizen
  # cookiecutter
  # copier
  # cruft
  # databricks-cli
  # django
  # gitman
  # oca-maintainers-tools@git+https://github.com/OCA/maintainer-tools.git
  # pre-commit
  # revup
  # streamlit
  # xxh-xxh
)
if ! command -v rye &>/dev/null; then
  echo "Installing rye with cargo"
  cargo install --git https://github.com/mitsuhiko/rye rye || true
fi

if command -v rye &>/dev/null; then
  echo "Installing global python binaries with rye"
  for package in $packages; do
    rye install "$package" || true
  done
fi
