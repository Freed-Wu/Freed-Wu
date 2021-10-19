let g:which_key_map_startify_dot = {
      \ 'name': '+mru & directory',
      \ }

for s:startify_commands in get(g:, 'startify_commands', [])
  for [s:startify_command_key, s:startify_command] in items(s:startify_commands)
    if s:startify_command_key[0] ==# '.'
      let g:which_key_map_startify_dot = extend(g:which_key_map_startify_dot, {s:startify_command_key[1]: s:startify_command})
    elseif s:startify_command_key[0] !=# g:maplocalleader
      execute 'let g:which_key_map_startify_'.s:startify_command_key[0].' = extend(g:which_key_map_startify_'.s:startify_command_key[0].', {s:startify_command_key[1]: s:startify_command})'
    endif
  endfor
endfor

for b:startify_bookmarks in get(g:, 'startify_bookmarks', [])
  for [b:startify_bookmark_key, b:startify_bookmark] in items(b:startify_bookmarks)
    let b:which_key_map_localleader = extend(get(b:, 'which_key_map_localleader', copy(g:which_key_map_localleader)), {b:startify_bookmark_key[1]: b:startify_bookmark})
  endfor
endfor

nnoremap <silent><buffer> [[ ?<C-R>=join(b:startify_lists, '\\|')<CR><CR>:let @/=''<CR>
nnoremap <silent><buffer> ]] /<C-R>=join(b:startify_lists, '\\|')<CR><CR>:let @/=''<CR>
nnoremap <silent><buffer> [] ?<C-R>=join(b:startify_lists, '\\|')<CR><CR>}:let @/=''<CR>
nnoremap <silent><buffer> ][ /<C-R>=join(b:startify_lists, '\\|')<CR><CR>{:let @/=''<CR>

setlocal nowrap
setlocal nonumber
setlocal norelativenumber
setlocal buftype=nofile
setlocal cursorline
setlocal cursorcolumn
setlocal foldlevel=9

AnyFoldActivate

let b:startify_lists = []
for b:startify_list in g:startify_lists
  let b:startify_lists += [b:startify_list['header'][0]]
endfor

nnoremap <silent><nowait><buffer> . :<C-U>WhichKey '.'<CR>
