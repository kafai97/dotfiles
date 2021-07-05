
change_hermit_env() {
  CUR=${PWD}
  while [ "$CUR" != "/" ]; do
    if [ "${CUR}" -ef "${HERMIT_ENV}" ]; then return; fi
    if [ -f "${CUR}/bin/activate-hermit" ]; then
      if [ -n "${HERMIT_ENV+_}"  ]; then type _hermit_deactivate &>/dev/null && _hermit_deactivate; fi
      # shellcheck source=files/activate-hermit
      if [ "${CUR}" != "${DEACTIVATED_HERMIT}" ]; then
        . "${CUR}/bin/activate-hermit"
      fi
      return
    fi
    CUR="$(dirname "${CUR}")"
  done
  unset DEACTIVATED_HERMIT
  if [ -n "${HERMIT_ENV+_}"  ]; then type _hermit_deactivate &>/dev/null && _hermit_deactivate; fi
}

precmd_functions+=(change_hermit_env)

# shellcheck disable=SC2154
if [[ -n ${_comps+x} ]]; then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C "$HOME/bin/hermit" hermit
fi
