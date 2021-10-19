function! init#firenvim#source() abort
  if !exists('g:started_by_firenvim')
    return
  endif
  let g:firenvim_config = {
        \ 'localSettings': {
          \ '.*': {
            \ 'cmdline': 'firenvim',
            \ 'selector': 'textarea',
            \ }}}
  nnoremap <silent> <C-\> :<C-U>call firenvim#focus_page()<CR>
  nnoremap <silent> <C-Z> :<C-U>call firenvim#hide_frame()<CR>
endfunction

if exists('g:started_by_firenvim')
  augroup init#firenvim
    autocmd!
    autocmd BufEnter {github.com,www.cnblogs.com,www.jianshu.com}_*.txt set filetype=pandoc
    autocmd BufEnter www.bitahub.com_*.txt set filetype=sh
    autocmd BufEnter forums.gentoo.org_*.txt set filetype=bbcode
    autocmd UIEnter * set laststatus=0
    autocmd UIEnter * set showtabline=0
  augroup END
endif
