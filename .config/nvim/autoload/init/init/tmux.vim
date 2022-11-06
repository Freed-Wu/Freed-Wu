function! init#init#tmux#show(...) abort
  let l:word = init#parse(a:)
  echo system('tmux show -g ' . l:word)
endfunction

function! init#init#tmux#execute(...) abort
  let l:word = init#parse(a:)
  let l:line = getline(l:word)
  echo system('tmux ' . l:line)
endfunction
