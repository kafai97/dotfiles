let mapleader = "\<space>"

nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

set timeoutlen=50

let g:leader_key_map =  {}

let g:leader_key_map.w = [':bdelete', 'buffer close']

let g:leader_key_map.v = [':source $MYVIMRC', 'source vim']

let g:leader_key_map.n = [':Startify', 'startify']

let g:leader_key_map['/'] = [':Commentary', 'comment']
vnoremap <leader>/ :Commentary<CR>

let g:leader_key_map.p= {
  \ 'name' : '+fzf' ,
  \ 'p' : [':Files', 'files'],
  \ 'b' : [':Buffers', 'buffers'],
  \ 'g' : [':Rg', 'rg'],
  \ 'm' : [':Marks', 'marks'],
  \ }

let g:leader_key_map.t = {
  \ 'name' : '+terminal' ,
  \ 'f' : [':FloatermNew fzf', 'fzf'],
  \ 'r' : [':FloatermNew rg', 'rg'],
  \ 'g' : [':FloatermNew lazygit', 'git'],
  \ 'd' : [':FloatermNew lazydocker', 'docker'],
  \ 'k' : [':FloatermNew k9s', 'k9s'],
  \ }

let g:leader_key_map.e = [':CocCommand explorer', 'explorer']
let g:leader_key_map.j = {
  \ 'name' : '+coc',
  \ '[': ['<Plug>(coc-diagnostic-prev)', 'diagnostic-prev'],
  \ ']': ['<Plug>(coc-diagnostic-next)', 'diagnostic-next'],
  \ 'd': ['<Plug>(coc-definition)', 'definition'],
  \ 'y': ['<Plug>(coc-type-definition)', 'type-definition'],
  \ 'i': ['<Plug>(coc-implementation)', 'implementation'],
  \ 'r': ['<Plug>(coc-references)', 'references'],
  \ 'n': ['<Plug>(coc-rename)', 'rename'],
  \ 'f': ['<Plug>(coc-format-selected)', 'format-selected'],
  \ 'a': ['<Plug>(coc-codeaction)', 'codeaction'],
  \ 'as': ['<Plug>(coc-codeaction-selected)', 'codeaction-selected'],
  \ 'af': ['<Plug>(coc-fix-current)', 'fix-current'],
  \ }

nnoremap <silent> <C-i> :call <SID>show_documentation()<CR>
xmap <leader>jf  <Plug>(coc-format-selected)
xmap <leader>jas  <Plug>(coc-codeaction-selected)

call which_key#register('<Space>', "g:leader_key_map")
