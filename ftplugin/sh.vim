setlocal isfname-==

nnoremap <silent><buffer> <LocalLeader>s :%s=/usr/=$MINGW_PREFIX/=g<CR>

call init#init#sh#map()
