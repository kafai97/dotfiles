export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_BUNDLE_NO_LOCK=1
export HOMEBREW_BUNDLE_FILE="$XDG_CONFIG_HOME/homebrew/Brewfile"

brew-dump() {
  brew bundle dump --file=- | egrep "$(brew leaves | xargs printf '"%s"|')tap|cask" >$HOMEBREW_BUNDLE_FILE
}
