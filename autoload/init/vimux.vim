function! init#vimux#source() abort
  inoremap <C-CR> <ESC>:<C-U>VimuxRunCommand getline('.')<CR>o
  nnoremap <C-CR> :<C-U>VimuxRunCommand getline('.')<CR>j
  xnoremap <C-CR> :<C-U>VimuxRunCommand getline('.')[col('v') - 1:col("'>") - 1]<CR>
  nnoremap g<C-CR> :<C-U>VimuxRunCommand '<C-R><C-W>'<CR>
  nnoremap z<C-CR> :<C-U>VimuxRunLastCommand<CR>
  nnoremap <M-CR> :<C-U>VimuxPromptCommand<CR>
  inoremap <M-U> <C-O>:VimuxScrollUpInspect<CR>
  inoremap <M-D> <C-O>:VimuxScrollDownInspect<CR>
  nnoremap <M-U> :<C-U>VimuxScrollUpInspect<CR>
  nnoremap <M-D> :<C-U>VimuxScrollDownInspect<CR>
endfunction
