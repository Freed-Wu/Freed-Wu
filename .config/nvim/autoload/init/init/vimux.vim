" must use a function to wrap because of vim-bracketed-paste
function! init#init#vimux#run(str) abort
  " https://github.com/root-project/cling/issues/495
  " for ruby, use pry to replace irb
  if index(['c', 'cpp', 'objc', 'objcpp', 'tcl'], &filetype) != -1
    VimuxRunCommand substitute(a:str, '\r', '\n', 'g')
  else
    VimuxRunCommand "\<Esc>[200~" . substitute(a:str, '\r', '\n', 'g') . "\<Esc>[201~"
  endif
endfunction
