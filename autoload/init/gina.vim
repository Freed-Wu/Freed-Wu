function! init#gina#source() abort
  let g:gina#action#mark_sign_text = '✓'
  let g:gina#command#blame#formatter#current_mark = '✓'
endfunction

function! init#gina#post_source() abort
  call gina#custom#mapping#nmap(
        \ '/.*', 'J',
        \ '<Plug>(gina-builtin-mark)j'
        \)
  call gina#custom#mapping#nmap(
        \ '/.*', 'K',
        \ 'k<Plug>(gina-builtin-mark)'
        \)
  call gina#custom#mapping#nmap(
        \ '/.*', '<C-J>',
        \ '<C-W>j'
        \)
  call gina#custom#mapping#nmap(
        \ '/.*', '<C-K>',
        \ '<C-W>k'
        \)
  call gina#custom#mapping#nmap(
        \ 'blame', 'R',
        \ '<Plug>(gina-blame-C-L)'
        \)
  call gina#custom#mapping#nmap(
        \ 'blame', '<C-L>',
        \ '<C-W>l'
        \)
endfunction

function! init#gina#map() abort
  nmap <buffer><nowait> <lt> <Plug>(gina-index-stage)
  nmap <buffer><nowait> > <Plug>(gina-index-unstage)
  nmap <buffer><nowait> = <Plug>(gina-index-discard)
  xmap <buffer><nowait> <lt> <Plug>(gina-index-stage)
  xmap <buffer><nowait> > <Plug>(gina-index-unstage)
  xmap <buffer><nowait> = <Plug>(gina-index-discard)
endfunction

augroup init#gina
  autocmd!
  if !exists('g:started_by_firenvim')
    autocmd BufEnter * Gina lcd
  endif
  autocmd VimEnter * autocmd Filetype gina-* call init#gina#map()
augroup END
