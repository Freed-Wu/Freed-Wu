function! init#vista#source() abort
  let g:vista_sidebar_width = &columns / 4
  let g:vista_sidebar_keepalt = 1
  let g:vista_close_on_jump = 1
  let g:vista_executive_for = {
        \ 'vimwiki': 'markdown',
        \ 'pandoc': 'markdown',
        \ 'markdown': 'toc',
        \ }
  if exists('*nvim_open_win') || exists('*popup_create')
    let g:vista_echo_cursor_strategy = 'floating_win'
  endif
  nnoremap <silent> gO :<C-U>Vista show<CR>
endfunction
