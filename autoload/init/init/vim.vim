function! init#init#vim#map() abort
  if exists('*nvim_open_win') || exists('*popup_create')
    nnoremap <silent><nowait><buffer> <LocalLeader> :call quickui#context#open(b:context, {})<CR>
    xnoremap <silent><nowait><buffer> <LocalLeader> :<C-U>call quickui#context#open(b:context_v, {})<CR>
    let b:context = map([
          \ ['&Set', 'execute "set" substitute(expand("<cword>"), "''", "", "g") . "?"'],
          \ ['&Echo', 'execute "echo" substitute(expand("<cWORD>"), ''[|\|`]'', "", "g")'],
          \ ['&Has', 'execute "echo" has(expand("<cword>"))'],
          \ ['&Autocmd', 'execute "autocmd" substitute(expand("<cword>"), ''|\|`'', "", "g")'],
          \ ['H&ighlight', 'execute "highlight" expand("<cword>")'],
          \ ['&Map', 'execute "map" expand("<cWORD>")'],
          \ ['&Function', 'execute "function" substitute(expand("<cword>"), ''|\|`\|(.*)'', "", "g")'],
          \ ['E&xecute', 'execute getline(line("."))'],
          \ ] , {_, v -> v + [get(v, 1)]})
    let b:context_v = map([
          \ ['&Set', 'execute "set" substitute(getline(".")[col("v") - 1:col("''>") - 1], "''", "", "g") . "?"'],
          \ ['&Echo', 'execute "echo" substitute(getline(".")[col("v") - 1:col("''>") - 1], ''[|\|`]'', "", "g")'],
          \ ['&Has', 'execute "echo" has(getline(".")[col("v") - 1:col("''>") - 1])'],
          \ ['&Autocmd', 'execute "autocmd" substitute(getline(".")[col("v") - 1:col("''>") - 1]), ''|\|`'', "", "g")'],
          \ ['H&ighlight', 'execute "highlight" getline(".")[col("v") - 1:col("''>") - 1]'],
          \ ['&Map', 'execute "map" getline(".")[col("v") - 1:col("''>") - 1]'],
          \ ['&Function', 'execute "function" substitute(getline(".")[col("v") - 1:col("''>") - 1], ''|\|`\|(.*)'', "", "g")'],
          \ ['E&xecute', 'execute substitute(join(getline(line("v"),line("''>") - 1), "\n"), '' "[{}]\{3}'', '''', ''g'')'],
          \ ] , {_, v -> v + [get(v, 1)]})
  endif
endfunction
