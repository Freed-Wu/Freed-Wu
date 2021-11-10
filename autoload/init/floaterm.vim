function! init#floaterm#source() abort
  let g:floaterm_title = '$1/$2'
  let g:floaterm_width = 0.5
  let g:floaterm_height = 0.5
  let g:floaterm_autoclose = 1
  let g:floaterm_keymap_new = '<C-\>c'
  let g:floaterm_keymap_prev = '<C-\>p'
  let g:floaterm_keymap_next = '<C-\>n'
  let g:floaterm_keymap_first = '<C-\>1'
  let g:floaterm_keymap_last = '<C-\>0'
  let g:floaterm_keymap_hide = '<C-\>z'
  let g:floaterm_keymap_show = '<C-\>s'
  let g:floaterm_keymap_kill = '<C-\>x'
  let g:floaterm_keymap_toggle = '<C-\>`'
  let g:floaterms = {
        \ 'python': 'python',
        \ 'julia': 'julia',
        \ 'octave': 'octave',
        \ 'gnuplot': 'gnuplot',
        \ 'r': 'R',
        \ }
  if has('nvim')
    highlight FloatermNC guibg=gray
  endif
  inoremap <silent> <S-CR> <ESC>:<C-U>execute 'FloatermSend' escape(getline('.'), '%#')<CR>o
  nnoremap <silent> <S-CR> :<C-U>execute 'FloatermSend' escape(getline('.'), '%#')<CR>j
  xnoremap <silent> <S-CR> y:FloatermSend escape(substitute('<C-R>0', '\r', '\n', 'g'), '%#')<CR>
  nnoremap <silent> g<S-CR> :<C-U>execute 'FloatermSend' escape('<C-R><C-W>', '%#')<CR>
  nnoremap <silent> <C-\><Bar> :<C-U>execute 'FloatermNew --wintype=vsplit' get(g:floaterms, &filetype, '')<CR>
  nnoremap <silent> <C-\>- :<C-U>execute 'FloatermNew --wintype=split' get(g:floaterms, &filetype, '')<CR>
  nnoremap <silent> <C-\>! :<C-U>execute 'FloatermNew --wintype=float' get(g:floaterms, &filetype, '')<CR>
endfunction

if exists('##TermEnter')
  augroup init#floaterm
    autocmd!
    autocmd TermEnter * setfiletype floaterm
  augroup END
endif
