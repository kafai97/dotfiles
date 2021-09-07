change_hermit_env() {
  local CUR=${PWD}
  while [ "$CUR" != "/" ]; do
    if [ "${CUR}" -ef "${HERMIT_ENV}" ]; then return; fi
    if [ -f "${CUR}/.local/bin/activate-hermit" ]; then
      if [ -n "${HERMIT_ENV+_}" ]; then type _hermit_deactivate &>/dev/null && _hermit_deactivate; fi
      # shellcheck source=files/activate-hermit
      if [ "${CUR}" != "${DEACTIVATED_HERMIT}" ]; then
        if "${HOME}/.local/bin/hermit" --quiet validate env "${CUR}"; then
          . "${CUR}/.local/bin/activate-hermit"
        fi
      fi
      return
    fi
    CUR="$(dirname "${CUR}")"
  done
  unset DEACTIVATED_HERMIT
  if [ -n "${HERMIT_ENV+_}" ]; then type _hermit_deactivate &>/dev/null && _hermit_deactivate; fi
}

precmd_functions+=(change_hermit_env)

# shellcheck disable=SC2154
if [[ -n ${_comps+x} ]]; then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C "$HOME/.local/bin/hermit" hermit
fi
