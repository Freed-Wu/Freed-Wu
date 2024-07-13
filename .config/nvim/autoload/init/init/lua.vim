function! init#init#lua#echo(...) abort
  let l:word = init#parse(a:)
  execute 'lua vim.print(' l:word ')'
endfunction

function! init#init#lua#execute(...) abort
  let l:line = init#parse(a:)
  let l:line = substitute(l:line, '\<local\>', '', 'g')
  execute 'lua' l:line
endfunction
