function! init#treesitter#source() abort
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
  " lua/treesitter.lua
  lua require("treesitter")
endfunction

function! s:init() abort
  let g:airline_section_x = airline#section#create_right([
        \ '%{empty(nvim_treesitter#statusline()) ? "" : '
        \ . 'nvim_treesitter#statusline() . g:airline_right_alt_sep}',
        \ 'filetype',
        \ ])
endfunction

augroup init#treesitter
  autocmd!
  autocmd User AirlineAfterInit call s:init()
augroup END
