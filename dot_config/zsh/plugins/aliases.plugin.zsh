#!/usr/bin/env zsh

alias ch="chezmoi"
alias chcd="cd $(chezmoi source-path)"

alias dk="docker"
alias ldk="lazydocker"

alias k="kubectl"
alias ks="k9s"

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

alias kc="kubectx"
alias kns="kubens"
alias khns="kubectl-hns"

alias py="python"
alias pip="noglob pip"
alias poetry="noglob poetry"
alias p="$aliases[poetry]"

alias zshrc="$EDITOR ~/.zshrc"
alias lg="lazygit"
alias tf="terraform"
alias vim="nvim"
alias y="yarn"

if command -v bat >/dev/null; then
  alias cat="bat"
elif command -v batcat >/dev/null; then
  alias cat="batcat"
fi

# Define functions and completions.
md() {
  [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1"
}

dotenv() {
  dotenv_file="${1:-.env}"
  [[ -f $dotenv_file ]] && set -a && source $dotenv_file && set +a
}

venv() {
  venv_path="${1:-.venv}"
  [[ -f $venv_path/bin/activate ]] && source $venv_path/bin/activate
}

brew-dump() {
  brew bundle dump --file=- | egrep "$(brew leaves | xargs printf '"%s"|')tap|cask" >$HOMEBREW_BUNDLE_FILE
}
