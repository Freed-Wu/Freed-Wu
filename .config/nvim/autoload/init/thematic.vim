function! init#thematic#source() abort
  " airline-theme cannot use random
  let g:thematic#themes = {
        \ 'random' :{
        \ 'colorscheme': 'random',
        \ 'background': 'dark',
        \ },
        \ 'molokai' :{
        \ 'colorscheme': 'molokai',
        \ 'airline-theme': 'molokai',
        \ 'background': 'dark',
        \ },
        \ 'solarized_flood' :{
        \ 'colorscheme': 'solarized',
        \ 'airline-theme': 'solarized_flood',
        \ 'background': 'dark',
        \ },
        \ 'bubblegum' :{
        \ 'colorscheme': 'bubblegum',
        \ 'airline-theme': 'bubblegum',
        \ 'background': 'dark',
        \ },
        \ 'papercolor' :{
        \ 'colorscheme': 'papercolor',
        \ 'airline-theme': 'papercolor',
        \ 'background': 'dark',
        \ },
        \ 'pencil' :{
        \ 'colorscheme': 'pencil',
        \ 'background': 'dark',
        \ },
        \ 'darkeclipse' :{
        \ 'colorscheme': 'darkeclipse',
        \ 'airline-theme': 'dark',
        \ 'background': 'dark',
        \ },
        \ 'space-vim-dark' :{
        \ 'colorscheme': 'space-vim-dark',
        \ 'airline-theme': 'dark',
        \ 'background': 'dark',
        \ },
        \ 'gruvbox' :{
        \ 'colorscheme': 'gruvbox',
        \ 'airline-theme': 'badwolf',
        \ 'background': 'dark',
        \ },
        \ 'OceanicNext' :{
        \ 'colorscheme': 'OceanicNext',
        \ 'airline-theme': 'luna',
        \ 'background': 'dark',
        \ },
        \ 'dracula' :{
        \ 'colorscheme': 'dracula',
        \ 'airline-theme': 'dracula',
        \ 'background': 'dark',
        \ },
        \ 'spacecamp' :{
        \ 'colorscheme': 'spacecamp',
        \ 'airline-theme': 'dark',
        \ 'background': 'dark',
        \ },
        \ }
endfunction

augroup init#thematic
  autocmd!
  autocmd VimEnter * ThematicRandom
augroup END
" ex: tabstop=2 shiftwidth=2
