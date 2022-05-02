if exists('*nvim_open_win') || exists('*popup_create')
  nnoremap <silent><nowait><buffer> <LocalLeader> :call quickui#context#open(b:context, {})<CR>
  xnoremap <silent><nowait><buffer> <LocalLeader> :<C-U>call quickui#context#open(b:context_v, {})<CR>
  let b:context = map([
        \ ['&Echo', 'execute "echo" substitute(expand("<cWORD>"), ''[|\|`]'', "", "g")'],
        \ ] , {_, v -> v + [get(v, 1)]})
  let b:context_v = map([
        \ ['&Echo', 'execute "echo" substitute(getline(".")[col("v") - 1:col("''>") - 1], ''[|\|`]'', "", "g")'],
        \ ] , {_, v -> v + [get(v, 1)]})
endif
