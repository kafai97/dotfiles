#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
#
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  asdf
  # celery
  deno
  docker
  docker-compose
  dotnet
  fzf
  gh
  git
  gitignore
  git-flow-avh
  git-lfs
  golang
  helm
  httpie
  kubectl
  ng
  npm
  pip
  python
  sudo
  terraform
  # vi-mode
  vscode
  # web-search
  wd
  yarn
  # zsh-interactive-cd
  z

  # argocd
  az
  brew
  dapr
  dotfiles
  # faas-cli
  fast-syntax-highlighting
  # glooctl
  hasura
  helmfile
  hermit
  k3d
  kconf
  # kn
  kool
  # kubeless
  linode-cli
  # mc
  pdm
  pipx
  pnpm
  poetry
  # rio
  ssh
  # tkn
  yq
  zsh-autosuggestions
  # zsh-vi-mode
)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# setopt globdots
export KUBECONFIG=$HOME/.kube/config
export KUBE_EDITOR=lvim

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

dotenv() {
  dotenv_file=${1:-.env}
  set -a && source $dotenv_file && set +a
}

alias venv="source ./.venv/bin/activate"

alias ls='exa --all --long --git --sort=type --icons'
alias l='exa --all --long --git --sort=type --icons'
alias cat="bat --plain"
alias c="bat --plain"
alias rm="rm -ri"

alias vi="vim"
alias vim="nvim"
alias nvim="lvim"
alias vimz="vim ~/.zshrc"
alias codez="code ~/.zshrc"

alias py="python"
alias p="poetry"
alias dk="docker"
alias ldk='lazydocker'
alias lg='lazygit'
alias degit="npx degit"
alias tf='terraform'

alias asdfpa="asdf plugin-add"
alias asdfprm="asdf plugin-remove"
alias asdfi="asdf install"
alias asdfu="asdf uninstall"
alias asdfg="asdf global"
alias asdfl="asdf local"
alias asdfls="asdf list"


alias gfirst="git commit --allow-empty -m \"initial commit\""
alias gcnow="git commit -m \"regular update [$(gdate -u -Isecond)]\""

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####

