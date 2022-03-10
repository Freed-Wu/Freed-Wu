function! init#vimux#source() abort
  inoremap <silent> <C-CR> <ESC>:<C-U>VimuxRunCommand getline('.')<CR>o
  " https://github.com/preservim/vimux/issues/87
  nnoremap <silent> <C-CR> :<C-U>VimuxRunCommand substitute(getline('.'), ';$', '; ', 'g')<CR>j
  xnoremap <silent> <C-CR> y:call init#init#vimux#run(@0)<CR>
  nnoremap <silent> g<C-CR> :<C-U>VimuxRunCommand '<C-R><C-W>'<CR>
  nnoremap <silent> z<C-CR> :<C-U>VimuxRunLastCommand<CR>
  nnoremap <silent> <M-CR> :<C-U>VimuxPromptCommand<CR>
  inoremap <silent> <M-U> <C-O>:VimuxScrollUpInspect<CR>
  inoremap <silent> <M-D> <C-O>:VimuxScrollDownInspect<CR>
  nnoremap <silent> <M-U> :<C-U>VimuxScrollUpInspect<CR>
  nnoremap <silent> <M-D> :<C-U>VimuxScrollDownInspect<CR>
endfunction
