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

function! init#init#coc#format(isvisual) abort
  if a:isvisual
    if CocHasProvider('formatRange')
      call CocActionAsync('formatSelected', visualmode())
    else
      *TrailGuide fix
    endif
  else
    if CocHasProvider('format')
      call CocActionAsync('format')
    else
      TrailGuide fix
    endif
  endif
endfunction

function! init#init#coc#openLink() abort
  if &buftype ==# ''
    call CocActionAsync('openLink')
  elseif has('nvim')
    lua vim.ui.open(vim.fn.expand('<cfile>'))
  else
    call netrw#BrowseX(netrw#GX(), netrw#CheckIfRemote(netrw#GX()))
  endif
endfunction

function! init#init#coc#action(feature, action, hotkey) abort
  if CocHasProvider(a:feature)
    call CocActionAsync(a:action)
  else
    execute 'normal!' a:hotkey
  endif
endfunction
