#!/usr/bin/env bash

set -xuo

BIN_DIR=$HOME/.local/bin

if ! command -v hermit &>/dev/null; then
  curl -fsSL https://github.com/cashapp/hermit/releases/download/stable/install.sh | HERMIT_BIN_INSTALL_DIR=$BIN_DIR sh
fi

if ! command -v dapr &>/dev/null; then
  curl -fsSL https://raw.githubusercontent.com/dapr/cli/master/install/install.sh | DAPR_INSTALL_DIR=$BIN_DIR sh
fi

if ! command -v hasura &>/dev/null; then
  curl -fsSL https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | INSTALL_PATH=$BIN_DIR sh
fi

if ! command -v kool &>/dev/null; then
  curl -fsSL https://kool.dev/install | BIN_PATH=$BIN_DIR/kool sh
fi

if ! command -v kubectl-crossplane &>/dev/null; then
  cd $BIN_DIR
  curl -fsSL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh
fi

if command -v corepack &>/dev/null; then
  corepack prepare --all
  corepack enable --install-directory $BIN_DIR pnpm yarn
fi

if ! command -v lvim &>/dev/null; then
  curl -fsSL https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh | sh -s -- --no-install-dependencies
fi
