export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"

alias py="python"
alias pip="noglob pip"
alias poetry="noglob poetry"
alias p="$aliases[poetry]"

venv() {
  venv_path="${1:-.venv}"
  [[ -f $venv_path/bin/activate ]] && source $venv_path/bin/activate
}
