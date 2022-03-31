function! init#firenvim#source() abort
  if !exists('g:started_by_firenvim')
    return
  endif
  let g:firenvim_config = {
        \ 'localSettings': {
          \ '.*': {
            \ 'cmdline': 'firenvim',
            \ 'selector': 'textarea:not([readonly])',
            \ }}}
  nnoremap <silent> <C-\> :<C-U>call firenvim#focus_page()<CR>
  nnoremap <silent> <C-Z> :<C-U>call firenvim#hide_frame()<CR>
endfunction

function! init#firenvim#map() abort
  " only work in browser
  map <C-;> <C-N>
  map <C-.> <C-T>
  map <C--> <C-W>
  map <C-=> <C-Q>
  map <S-lt> <lt>
  imap <C-;> <C-N>
  imap <C-.> <C-T>
  imap <C--> <C-W>
  imap <C-=> <C-Q>
  imap <S-lt> <lt>
endfunction

if exists('g:started_by_firenvim')
  augroup init#firenvim
    autocmd!
    autocmd BufEnter {aur.archlinux.org,github.com,www.cnblogs.com,www.jianshu.com}_*.txt set filetype=pandoc
    autocmd BufEnter www.bitahub.com_*.txt set filetype=sh
    autocmd BufEnter forums.gentoo.org_*.txt set filetype=bbcode
    autocmd UIEnter * set laststatus=0
    autocmd UIEnter * set showtabline=0
    autocmd VimEnter * call init#firenvim#map()
  augroup END
endif
