scriptencoding utf-8

function! s:startify() abort
  unmap <buffer> b
  unmap <buffer> B
  unmap <buffer> s
  unmap <buffer> S
  unmap <buffer> t
  unmap <buffer> T
  unmap <buffer> v
  unmap <buffer> V
  unmap <buffer> e
  unmap <buffer> q
  nunmap <buffer> n
  nunmap <buffer> N
  nmap <buffer> o <Plug>(startify-open-buffers)
  nnoremap <silent><buffer> i :call startify#set_mark('B')<CR>j
  nnoremap <silent><buffer> s :call startify#set_mark('S')<CR>j
  nnoremap <silent><buffer> I :call startify#set_mark('T')<CR>j
  nnoremap <silent><buffer> S :call startify#set_mark('V')<CR>j
  nnoremap <silent><buffer> gi :call startify#set_batchmode('B')<CR>j
  nnoremap <silent><buffer> gs :call startify#set_batchmode('S')<CR>j
  nnoremap <silent><buffer> gI :call startify#set_batchmode('T')<CR>j
  nnoremap <silent><buffer> gS :call startify#set_batchmode('V')<CR>j
endfunction

function! s:gitModified() abort
  let files = systemlist('git ls-files -m 2>/dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked() abort
  let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! init#startify#source() abort
  if exists('g:started_by_firenvim')
    let g:startify_disable_at_vimenter = 1
  endif
  let g:startify_update_oldfiles = 1
  let g:startify_change_to_vcs_root = 1
  let g:startify_enable_special = 0
  let g:startify_relative_path = 1
  if filereadable(expand('$PREFIX/etc/issue'))
    let g:startify_custom_header = map(readfile(expand('$PREFIX/etc/issue')), {_, v -> substitute(v, "\x1b\[[0-9;\?]\\{-}\\a", '', 'g')})
  endif
  let g:startify_bookmarks = [
        \ {g:maplocalleader . 'v': fnamemodify(expand('$XDG_CONFIG_HOME/nvim/init.vim'), ':~')},
        \ {g:maplocalleader . 'c': fnamemodify(expand('$XDG_CONFIG_HOME/nvim/autoload/init/coc.vim'), ':~')},
        \ {g:maplocalleader . 'j': fnamemodify(expand('$XDG_CONFIG_HOME/nvim/coc-settings.json'), ':~')},
        \ {g:maplocalleader . 't': fnamemodify(expand('$XDG_CONFIG_HOME/nvim/lua/treesitter.lua'), ':~')},
        \ {g:maplocalleader . 's': '~/.zshrc'},
        \ {g:maplocalleader . 'z': '~/.zprofile'},
        \ {g:maplocalleader . 'x': '~/.xprofile'},
        \ {g:maplocalleader . 'b': '~/.bash_profile'},
        \ {g:maplocalleader . 'y': fnamemodify(expand('$XDG_CONFIG_HOME/ptpython/config.py'), ':~')},
        \ {g:maplocalleader . 'p': fnamemodify(expand('$PYTHONSTARTUP'), ':~')},
        \ ]
  if filereadable('/etc/nixos/configuration.nix')
    let g:startify_bookmarks += [
          \ {g:maplocalleader . 'n': '/etc/nixos/configuration.nix'},
          \ ]
  endif
  let g:startify_custom_indices =
        \ map(range(0x61, 0x7a) + range(0x41, 0x5a), {_, v -> '.' . nr2char(v)})
  let g:startify_lists = [
        \ {'type': 'sessions', 'header': ['󰍒 Sessions']},
        \ {'type': 'files',
        \ 'header': ['󰍐 Global Histories'],
        \ 'indices': map(range(1, 9) + [0], {_, v -> g:maplocalleader . v}),
        \ },
        \ {'type': 'dir',
        \ 'header': ['󰍎 Local Histories'],
        \ 'indices': map(range(1, 9) + [0], {_, v -> '.' . v}),
        \ },
        \ {'type': function('s:gitModified'),  'header': ['! Git Modified']},
        \ {'type': function('s:gitUntracked'), 'header': ['? Git Untracked']},
        \ {'type': 'commands', 'header': [' Commands']},
        \ {'type': 'bookmarks', 'header': ['󰍑 Bookmarks']},
        \ ]
endfunction

augroup init#startify
  autocmd!
  autocmd User Startified call s:startify()
augroup END
