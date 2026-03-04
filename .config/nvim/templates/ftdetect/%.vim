augroup {{ expand('%:t:r') }}
  autocmd!
  autocmd BufNewFile,BufRead *.{% here %} setfiletype {{ expand('%:t:r') }}
augroup END
