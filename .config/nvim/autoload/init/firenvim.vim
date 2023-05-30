function! init#firenvim#source() abort
  if !exists('g:started_by_firenvim')
    return
  endif
  let g:firenvim_config = {
        \ 'localSettings': {
          \ '.*': {
          \ 'cmdline': 'firenvim',
          \ 'priority': 0,
          \ },
          \ 'https://(poe|(www\.google|.*\.zhihu))\.com': {
          \ 'takeover': 'never',
          \ 'priority': 1,
          \ },
          \ }
          \ }
  nnoremap <silent> <C-z> :<C-U>call firenvim#hide_frame()<CR>
  inoremap <silent> <C-z> <C-O>:call firenvim#hide_frame()<CR>
  nnoremap <silent> <C-.> :<C-U>call firenvim#focus_page()<CR>
  inoremap <silent> <C-.> <C-O>:call firenvim#focus_page()<CR>
endfunction

augroup init#firenvim
  autocmd!
  autocmd BufEnter www.bitahub.com_project-run_*.txt set filetype=sh
  autocmd BufEnter forums.gentoo.org_*.txt set filetype=bbcode
  autocmd BufEnter {{*-forum,community,devforum,talk,discuss,discourse,gitlab}.*,*.stackexchange.com,aur.archlinux.org,github.com,www.{cnblogs,jianshu}.com}_*.txt set filetype=pandoc
  autocmd BufEnter {bbs.archlinux.org,forums.gentoo.org}_*.txt set filetype=bbcode
  autocmd BufEnter jqplay.org_jq_*.txt set filetype=jq
  autocmd BufEnter colab.research.google.com_*.txt set filetype=python
  autocmd BufEnter mail.*.txt set filetype=mail
  if exists('g:started_by_firenvim')
    autocmd UIEnter * set laststatus=0
    autocmd UIEnter * set showtabline=0
  endif
augroup END
