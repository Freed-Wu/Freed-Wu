try
  call emoji#conceal()
catch /^Vim\%((\a\+)\)\=:E117:/
endtry

setlocal nofoldenable
setlocal spell

nnoremap <buffer> ZQ ggdGZZ
