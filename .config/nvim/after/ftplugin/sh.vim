setlocal isfname-==
setlocal includeexpr=init#init#sh#includeexpr()
setlocal foldmethod=syntax

if expand('%:t') ==# '.envrc'
  compiler direnv
endif

nnoremap <silent><buffer> <LocalLeader>s :%s=/usr/=$MINGW_PREFIX/=g<CR>

call init#init#sh#map()
