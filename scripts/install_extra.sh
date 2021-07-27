#!/usr/bin/env bash

set -xuo

export HERMIT_BIN_INSTALL_DIR=${HOME}/.local/bin

curl -fsSL https://github.com/cashapp/hermit/releases/download/stable/install.sh | /bin/bash

export DAPR_INSTALL_DIR=${HOME}/.local/bin

curl -fsSL https://raw.githubusercontent.com/dapr/cli/master/install/install.sh | /bin/bash
