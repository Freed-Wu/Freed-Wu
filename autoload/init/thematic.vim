function! init#thematic#source() abort
  " airline-theme cannot use random
  let g:thematic#themes = {
        \ 'random' :{
        \ 'colorscheme': 'random',
        \ },
        \ 'molokai' :{
        \ 'colorscheme': 'molokai',
        \ 'airline-theme': 'molokai',
        \ },
        \ 'solarized_flood' :{
        \ 'colorscheme': 'solarized',
        \ 'airline-theme': 'solarized_flood',
        \ },
        \ 'bubblegum' :{
        \ 'colorscheme': 'bubblegum',
        \ 'airline-theme': 'bubblegum',
        \ },
        \ 'papercolor' :{
        \ 'colorscheme': 'papercolor',
        \ 'airline-theme': 'papercolor',
        \ },
        \ 'pencil' :{
        \ 'colorscheme': 'pencil',
        \ },
        \ 'darkeclipse' :{
        \ 'colorscheme': 'darkeclipse',
        \ 'airline-theme': 'dark',
        \ },
        \ 'space-vim-dark' :{
        \ 'colorscheme': 'space-vim-dark',
        \ 'airline-theme': 'dark',
        \ },
        \ 'gruvbox' :{
        \ 'colorscheme': 'gruvbox',
        \ 'airline-theme': 'badwolf',
        \ },
        \ 'OceanicNext' :{
        \ 'colorscheme': 'OceanicNext',
        \ 'airline-theme': 'luna',
        \ },
        \ 'dracula' :{
        \ 'colorscheme': 'dracula',
        \ 'airline-theme': 'dracula',
        \ },
        \ 'spacecamp' :{
        \ 'colorscheme': 'spacecamp',
        \ 'airline-theme': 'dark',
        \ },
        \ }
endfunction

augroup init#thematic
  autocmd!
  autocmd VimEnter * ThematicRandom
augroup END
