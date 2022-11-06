""
" https://github.com/neoclide/coc.nvim/wiki/Create-custom-source
function! coc#source#%FILE%#init() abort
  return {
        \ 'shortcut': '%FILE%',
        \ 'priority': 9,
        \ 'filetypes': ['%FILE%'],
        \ }
endfunction

""
" https://github.com/neoclide/coc.nvim/wiki/Create-custom-source
function! coc#source#%FILE%#complete(opt, cb) abort
  call a:cb(s:items)
endfunction
