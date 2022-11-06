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
  nnoremap <silent> <C-;> :<C-U>call firenvim#hide_frame()<CR>
  inoremap <silent> <C-;> <C-O>:call firenvim#hide_frame()<CR>
  nnoremap <silent> <C-.> :<C-U>call firenvim#focus_page()<CR>
  inoremap <silent> <C-.> <C-O>:call firenvim#focus_page()<CR>
endfunction

function! init#firenvim#map() abort
  " firefox's built-in hotkeys override firenvim
  map <C--> <C-T>
  map <C-=> <C-Q>
  imap <C--> <C-T>
  imap <C-=> <C-Q>

  map <S-lt> <lt>
  imap <S-lt> <lt>
endfunction

augroup init#firenvim
  autocmd!
  autocmd BufEnter www.bitahub.com_project-run_*.txt set filetype=sh
  autocmd BufEnter forums.gentoo.org_*.txt set filetype=bbcode
  autocmd BufEnter {*.stackexchange.com,aur.archlinux.org,github.com,www.cnblogs.com,www.jianshu.com}_*.txt set filetype=pandoc
  autocmd BufEnter {bbs.archlinux.org,forums.gentoo.org}_*.txt set filetype=bbcode
  autocmd BufEnter jqplay.org_jq_*.txt set filetype=jq
  autocmd BufEnter colab.research.google.com_*.txt set filetype=python
  autocmd BufEnter mail.*.txt set filetype=mail
  if exists('g:started_by_firenvim')
    autocmd UIEnter * set laststatus=0
    autocmd UIEnter * set showtabline=0
    autocmd VimEnter * call init#firenvim#map()
  endif
augroup END
