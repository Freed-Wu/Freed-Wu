setlocal isfname-==
setlocal includeexpr=init#init#sh#includeexpr()
setlocal makeprg=./%

if expand('%:t') ==# '.envrc'
  compiler direnv
elseif expand('%:t') ==# 'PKGBUILD'
  let b:browser_search_default_engine = 'archlinux'
elseif expand('%:e') ==# 'ebuild'
  let b:browser_search_default_engine = 'gentoo'
endif

nnoremap <silent><buffer> <LocalLeader>s :%s=/usr/=$MINGW_PREFIX/=g<CR>

call init#init#sh#map()
