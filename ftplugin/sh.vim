setlocal isfname-==
setlocal includeexpr=init#init#sh#includeexpr()

nnoremap <silent><buffer> <LocalLeader>s :%s=/usr/=$MINGW_PREFIX/=g<CR>

call init#init#sh#map()
