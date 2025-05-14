setlocal foldmethod=syntax

nnoremap <buffer> <Localleader><Localleader> :<C-U>%!jq -S . %<CR>
