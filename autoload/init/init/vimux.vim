" must use a function to wrap because of vim-bracketed-paste
function! init#init#vimux#run(str) abort
  VimuxRunCommand "\<Esc>[200~" . substitute(a:str, '\r', '\n', 'g') . "\<Esc>[201~"
endfunction
