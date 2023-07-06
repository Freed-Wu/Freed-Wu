function! init#init#coc#grep(type) abort
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, 'n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList grep' word
endfunction

function! init#init#coc#keywordprg(word) abort
  help coc-config.txt
  call search(a:word)
  normal! zMzv
endfunction

function! init#init#coc#includeexpr() abort
  if findfile(v:fname)
    return v:fname
  endif
  return 'coc-' . split(v:fname, '\.')[0]
endfunction
