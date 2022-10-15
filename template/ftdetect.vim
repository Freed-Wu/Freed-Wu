augroup %FILE%
  autocmd!
  autocmd BufNewFile,BufRead *.%HERE% setfiletype %FILE%
augroup END
