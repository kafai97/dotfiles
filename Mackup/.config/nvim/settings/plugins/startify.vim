
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
    \ { 'type': 'dir',                      'header': ['  Current Directory '. getcwd()]},
    \ { 'type': function('s:gitModified'),  'header': ['  git modified']},
    \ { 'type': function('s:gitUntracked'), 'header': ['  git untracked']},
    \ { 'type': 'files',                    'header': ['  Files']},
    \ { 'type': 'sessions',                 'header': ['  Sessions']},
    \ { 'type': 'bookmarks',                'header': ['  Bookmarks']},
    \ { 'type': 'commands',                 'header': ['  Commands']},
    \ ]

let g:startify_bookmarks = [
  \{ 'i': '~/.config/nvim/init.vim' },
  \{ 'c': '~/.config/nvim/coc-settings.json' },
  \{ 'z': '~/.zshrc' },
  \]

let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1

function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

