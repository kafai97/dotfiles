source $HOME/.config/nvim/settings/basic.vim
source $HOME/.config/nvim/settings/keybindings.vim

if !exists('g:vscode')
source $HOME/.config/nvim/settings/installs.vim
source $HOME/.config/nvim/settings/themes.vim
source $HOME/.config/nvim/settings/plugins/leaderkey.vim
source $HOME/.config/nvim/settings/plugins/startify.vim
source $HOME/.config/nvim/settings/plugins/fzf.vim
source $HOME/.config/nvim/settings/plugins/coc.vim
source $HOME/.config/nvim/settings/plugins/floaterm.vim
endif
