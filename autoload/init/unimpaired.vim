function! init#unimpaired#source() abort
  let g:which_key_map_leftbracket = {
        \ 'name': '+moveFoward',
        \ 'o':{
        \ 'name': '+options on',
        \ 'b': 'background',
        \ 'c': 'cursorline',
        \ 'd': 'diff',
        \ 'h': 'hlsearch',
        \ 'i': 'ignorecase',
        \ 'l': 'list',
        \ 'n': 'number',
        \ 'r': 'relativenumber',
        \ 's': 'spell',
        \ 'u': 'cursorcolumn',
        \ 'v': 'virtualedit',
        \ 'p': 'paste',
        \ 'w': 'wrap',
        \ 'x': 'cursorline&cursorcolumn',
        \ },
        \ }
  call which_key#register('[', 'g:which_key_map_leftbracket')
  let g:which_key_map_rightbracket = {
        \ 'name': '+moveBackword',
        \ 'o':{
        \ 'name': '+options off',
        \ 'b': 'background',
        \ 'c': 'cursorline',
        \ 'd': 'diff',
        \ 'h': 'hlsearch',
        \ 'i': 'ignorecase',
        \ 'l': 'list',
        \ 'n': 'number',
        \ 'r': 'relativenumber',
        \ 's': 'spell',
        \ 'u': 'cursorcolumn',
        \ 'v': 'virtualedit',
        \ 'p': 'paste',
        \ 'w': 'wrap',
        \ 'x': 'cursorline&cursorcolumn',
        \ },
        \ }
  call which_key#register(']', 'g:which_key_map_rightbracket')
  let g:which_key_map_y_o = {
        \ 'name': '+toggle options',
        \ 'b': 'background',
        \ 'c': 'cursorline',
        \ 'd': 'diff',
        \ 'h': 'hlsearch',
        \ 'i': 'ignorecase',
        \ 'l': 'list',
        \ 'n': 'number',
        \ 'r': 'relativenumber',
        \ 's': 'spell',
        \ 'u': 'cursorcolumn',
        \ 'v': 'virtualedit',
        \ 'p': 'paste',
        \ 'w': 'wrap',
        \ 'x': 'cursorline&cursorcolumn',
        \ }
  call which_key#register('yo', 'g:which_key_map_y_o')

  nmap y<Space> <Plug>unimpairedBlankUp<Plug>unimpairedBlankDown

  nnoremap <silent><nowait> yo :<C-U>WhichKey 'yo'<CR>
  nnoremap <silent><nowait> [ :<C-U>WhichKey '['<CR>
  xnoremap <silent><nowait> [ :<C-U>WhichKeyVisual '['<CR>
  nnoremap <silent><nowait> ] :<C-U>WhichKey ']'<CR>
  xnoremap <silent><nowait> ] :<C-U>WhichKeyVisual ']'<CR>
  nnoremap <silent> yom :<C-U>setlocal modifiable! modifiable?<CR>
  nnoremap <silent> [om :<C-U>setlocal modifiable<CR>
  nnoremap <silent> ]om :<C-U>setlocal nomodifiable<CR>
  if has('gui_running')
    nmap [of <Plug>FontsizeBegin<Plug>FontsizeDec
    nmap ]of <Plug>FontsizeBegin<Plug>FontsizeInc
    nmap yof <Plug>FontsizeDefault
    nnoremap <silent> yog :<C-U>set guifont=*<CR>
    nnoremap <silent> yok :<C-U>execute 'set guioptions' (&guioptions !~# 'm' ? '+' : '-') . '=m'<CR>
    nnoremap <silent> [ok :<C-U>set guioptions+=m<CR>
    nnoremap <silent> ]ok :<C-U>set guioptions-=m<CR>
    nnoremap <silent> yoK :<C-U>execute 'set guioptions' (&guioptions !~# 'T' ? '+' : '-') . '=T'<CR>
    nnoremap <silent> [oK :<C-U>set guioptions+=T<CR>
    nnoremap <silent> ]oK :<C-U>set guioptions-=T<CR>
    nnoremap <silent> yoj :<C-U>execute 'set guioptions' (&guioptions !~# 'b' ? '+' : '-') . '=b'<CR>
    nnoremap <silent> [oj :<C-U>set guioptions+=b<CR>
    nnoremap <silent> ]oj :<C-U>set guioptions-=b<CR>
    nnoremap <silent> yo[ :<C-U>execute 'set guioptions' (&guioptions !~# 'l' ? '+' : '-') . '=l'<CR>
    nnoremap <silent> [o[ :<C-U>set guioptions+=l<CR>
    nnoremap <silent> ]o[ :<C-U>set guioptions-=l<CR>
    nnoremap <silent> yo] :<C-U>execute 'set guioptions' (&guioptions !~# 'r' ? '+' : '-') . '=r'<CR>
    nnoremap <silent> [o] :<C-U>set guioptions+=r<CR>
    nnoremap <silent> ]o] :<C-U>set guioptions-=r<CR>
    nnoremap <silent> yo{ :<C-U>execute 'set guioptions' (&guioptions !~# 'L' ? '+' : '-') . '=L'<CR>
    nnoremap <silent> [o{ :<C-U>set guioptions+=L<CR>
    nnoremap <silent> ]o{ :<C-U>set guioptions-=L<CR>
    nnoremap <silent> yo} :<C-U>execute 'set guioptions' (&guioptions !~# 'R' ? '+' : '-') . '=R'<CR>
    nnoremap <silent> [o} :<C-U>set guioptions+=R<CR>
    nnoremap <silent> ]o} :<C-U>set guioptions-=R<CR>
  endif
endfunction

function! init#unimpaired#post_source() abort
  for key in filter(map(split(execute('map <Plug>(unimpaired-toggle)'), '\n'),
        \ {_, v -> matchstr(v, '<Plug>(unimpaired-toggle)\zs\w')}),
        \ {_, v -> !empty(v)})
    execute 'nmap' 'yo' . key '<Plug>(unimpaired-toggle)' . key
    execute 'nmap' '[o' . key '<Plug>(unimpaired-enable)' . key
    execute 'nmap' ']o' . key '<Plug>(unimpaired-disable)' . key
  endfor
endfunction
