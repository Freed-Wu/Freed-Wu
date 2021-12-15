function! init#vimux#source() abort
  inoremap <silent> <C-CR> <ESC>:<C-U>VimuxRunCommand getline('.')<CR>o
  nnoremap <silent> <C-CR> :<C-U>VimuxRunCommand getline('.')<CR>j
  xnoremap <silent> <C-CR> y:VimuxRunCommand substitute('<C-R>0', '\r', '\n', 'g')<CR>
  nnoremap <silent> g<C-CR> :<C-U>VimuxRunCommand '<C-R><C-W>'<CR>
  nnoremap <silent> z<C-CR> :<C-U>VimuxRunLastCommand<CR>
  nnoremap <silent> <M-CR> :<C-U>VimuxPromptCommand<CR>
  inoremap <silent> <M-u> <C-O>:VimuxScrollUpInspect<CR>
  inoremap <silent> <M-d> <C-O>:VimuxScrollDownInspect<CR>
  nnoremap <silent> <M-u> :<C-U>VimuxScrollUpInspect<CR>
  nnoremap <silent> <M-d> :<C-U>VimuxScrollDownInspect<CR>
endfunction
