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
  " firefox's built-in hotkeys override firenvim
  map <C--> <C-T>
  map <C-=> <C-Q>
  imap <C--> <C-T>
  imap <C-=> <C-Q>

  " fixed by new version of firefox, keep the code just for compatibility
  map <S-lt> <lt>
  imap <S-lt> <lt>
  " cannot work in new version of firefox
  map <C-;> <C-N>
  map <C-.> <C-W>
  imap <C-;> <C-N>
  imap <C-.> <C-W>
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
