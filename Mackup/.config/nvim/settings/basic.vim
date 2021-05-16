syntax enable
set hidden
set scrolloff=5
set cursorline
set mouse=a
set clipboard=unnamedplus
set showtabline=2
set nowrap
set nocompatible

set novisualbell
set noswapfile
set signcolumn=yes
set splitright
set splitbelow

set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set ignorecase
" set smartcase
set incsearch
set iskeyword+=-

" let g:python_host_prog = $HOME . '/.asdf/installs/python/2.7.18/bin/python'
let g:python3_host_prog = $HOME . '/.asdf/installs/python/3.8.10/bin/python'

set number relativenumber 
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
