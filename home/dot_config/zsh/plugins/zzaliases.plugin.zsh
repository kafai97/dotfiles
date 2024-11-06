#!/usr/bin/env zsh

alias zshrc="$EDITOR ~/.zshrc"

command -v python >/dev/null && alias py="python"
command -v pip >/dev/null && alias pip="noglob pip"
command -v poetry >/dev/null && alias poetry="noglob poetry"
command -v poetry >/dev/null && alias p="$aliases[poetry]"
command -v chezmoi >/dev/null && alias ch="chezmoi"
command -v chezmoi >/dev/null && alias chcd="cd $(chezmoi source-path)"
command -v docker >/dev/null && alias dk="docker"
command -v lazydocker >/dev/null && alias ldk="lazydocker"
command -v lazygit >/dev/null && alias lg="lazygit"
command -v nvim >/dev/null && alias vim="nvim"
command -v terraform >/dev/null && alias tf="terraform"
command -v brew >/dev/null && alias b="brew"
alias y="yarn"
alias jo="joshuto"

if command -v bat >/dev/null; then
  alias cat="bat"
elif command -v batcat >/dev/null; then
  alias cat="batcat"
fi

if command -v kubectl >/dev/null; then
  alias k="kubectl"
  alias ka="kubectl apply"
  alias kaf="kubectl apply -f"
  alias kdel="kubectl delete"
  alias kdelf="kubectl delete -f"
  alias krr='kubectl rollout restart'
  alias kcuc="kubectl config use-context"
  alias kcsc="kubectl config set-context"
  alias kcdc="kubectl config delete-context"
  alias kccc="kubectl config current-context"
  alias kcgc="kubectl config get-contexts"

  command -v k9s >/dev/null && alias ks="k9s"
  command -v kubectx >/dev/null && alias kc="kubectx"
  command -v kubens >/dev/null && alias kns="kubens"
  command -v kubectl-hns >/dev/null && alias khns="kubectl-hns"
fi

# Define functions and completions.
md() {
  [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1"
}

dotenv-source() {
  dotenv_file="${1:-.env}"
  [[ -f $dotenv_file ]] && set -a && source $dotenv_file && set +a
}

venv() {
  venv_path="${1:-.venv}"
  [[ -f $venv_path/bin/activate ]] && source $venv_path/bin/activate
}

brew-dump() {
  brew bundle dump --force --global --no-vscode
}

mise-venv() {
  version="${1:-3.11}"
  cat <<EOF >.mise.toml
[env]
_.file = ".env"
_.python.venv = ".venv"


[tools]
python = "$version"
uv = "latest"
EOF
}

mise-venv-create() {
  version="${1:-3.11}"
  $XDG_DATA_HOME/mise/installs/python/$version/bin/python -m venv .venv
}

code-python-settings() {
  if [[ ! -d '.vscode' ]]; then
    mkdir .vscode
  fi
  cat <<EOF >.vscode/settings.json
{
  "python.terminal.activateEnvironment": true,
  "python.envFile": "\${workspaceFolder}/.env",
}
EOF
}
