setlocal tabstop=4
setlocal shiftwidth=4

let b:browser_search_default_engine = 'cpan'

nnoremap <silent><buffer> [[ ?^sub <CR>:let @/=''<CR>
nnoremap <silent><buffer> ]] /^sub <CR>:let @/=''<CR>
nnoremap <silent><buffer> [] ?^sub <CR>f{%:let @/=''<CR>
nnoremap <silent><buffer> ][ /^sub <CR>f{%:let @/=''<CR>

call init#init#pod#map()
