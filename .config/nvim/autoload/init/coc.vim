scriptencoding utf-8
function! init#coc#source() abort
  set formatexpr=CocAction('formatSelected')
  let g:coc_snippet_next = '<Tab>'
  let g:coc_snippet_prev = '<S-Tab>'
  let g:coc_status_error_sign = '✗'
  let g:coc_status_warning_sign = ''
  " https://github.com/neoclide/coc.nvim/issues/4282#issuecomment-1279692192
  let g:coc_filetype_map = {
        \ 'bash': 'sh',
        \ 'zsh': 'sh',
        \ 'vimspec': 'vim',
        \ 'tutor': 'markdown',
        \ 'pandoc': 'markdown',
        \ 'mysql': 'sql',
        \ 'eelixir': 'elixir',
        \ 'sublime_syntax': 'yaml',
        \ 'liquid': 'html',
        \ }
  " https://github.com/NixOS/nixpkgs/issues/214147
  let g:coc_global_extensions = [
        \ 'coc-highlight',
        \
        \ 'coc-ci', 'coc-rime',
        \
        \ 'coc-pydocstring',
        \
        \ 'coc-diagnostic', 'coc-spell-checker', 'coc-markdownlint',
        \
        \ 'coc-prettier',
        \
        \ 'coc-tasks', 'coc-vimtex', 'coc-emmet',
        \ 'coc-snippets', 'coc-translator', 'coc-zi',
        \
        \ 'coc-marketplace', 'coc-lists', 'coc-yank', 'coc-git', 'coc-gist',
        \ 'coc-gitignore',
        \
        \ 'coc-dash-complete', 'coc-dot-complete', 'coc-just-complete',
        \ 'coc-bibtex',
        \
        \ 'coc-dictionary', 'coc-tag', 'coc-word', 'coc-emoji', 'coc-syntax',
        \
        \ 'coc-copilot',
        \
        \ '@yaegassy/coc-marksman',
        \ 'coc-webview', 'coc-markdown-preview-enhanced',
        \ 'coc-json', 'coc-yaml', 'coc-toml', 'coc-xml', 'coc-svg', 'coc-html',
        \ 'coc-clang-format-style-options', 'coc-docker',
        \ 'coc-sql', 'coc-sh', 'coc-vimlsp', 'coc-texlab', 'coc-perl',
        \ 'coc-jedi', 'coc-pyright', 'coc-lua', 'coc-solargraph', 'coc-clangd',
        \ ]
  " tabnine don't support android
  if $PREFIX !=# '/data/data/com.termux/files/usr'
    let g:coc_global_extensions += ['coc-tabnine']
  endif
  nnoremap <silent> K :<C-U>call CocAction('doHover')<CR>
  xnoremap <silent> K :<C-U>call CocAction('doHover')<CR>
  nnoremap gK K
  xnoremap gK K
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)
  omap ic <Plug>(coc-classobj-i)
  omap ac <Plug>(coc-classobj-a)
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <expr> <M-n> coc#float#scroll(1)
    nnoremap <expr> <M-p> coc#float#scroll(0)
    nnoremap <expr> <M-n> coc#float#scroll(1)
    nnoremap <expr> <M-p> coc#float#scroll(0)
    xnoremap <expr> <M-n> coc#float#scroll(1)
    xnoremap <expr> <M-p> coc#float#scroll(0)
  endif
  nmap g. <Plug>(coc-codeaction-selected)
  xmap g. <Plug>(coc-codeaction-selected)
  nmap g.. <Plug>(coc-codeaction)
  nmap [k <Plug>(coc-diagnostic-prev)
  nmap ]k <Plug>(coc-diagnostic-next)
  nmap [K <Plug>(coc-diagnostic-prev-error)
  nmap ]K <Plug>(coc-diagnostic-next-error)
  nmap gd <Plug>(coc-definition)
  nmap gD <Plug>(coc-declaration)
  nmap <C-W>d <C-W>s<Plug>(coc-definition)
  nmap <C-W>D <C-W>s<Plug>(coc-declaration)

  nmap gq <plug>(coc-format-selected)
  xmap gq <plug>(coc-format-selected)
  nmap gqq <plug>(coc-format)

  nmap w <Plug>(coc-ci-w)
  nmap b <Plug>(coc-ci-b)

  inoremap <silent><expr> <TAB> coc#expandableOrJumpable()
        \ ? "\<C-R>=coc#rpc#request('doKeymap',
        \ ['snippets-expand-jump', ''])\<CR>"
        \ : "\<TAB>" . coc#refresh()
  xmap <Tab> <Plug>(coc-snippets-select)
  xmap <S-Tab> <Plug>(coc-convert-snippet)

  " compatible with fugitive
  nnoremap <silent> y<C-g> :<C-u>CocCommand git.copyUrl<CR>
  nmap [g <Plug>(coc-git-prevchunk)
  nmap ]g <Plug>(coc-git-nextchunk)
  nmap [C <Plug>(coc-git-prevconflict)
  nmap ]C <Plug>(coc-git-nextconflict)
  omap ig <Plug>(coc-git-chunk-inner)
  xmap ig <Plug>(coc-git-chunk-inner)
  omap ag <Plug>(coc-git-chunk-outer)
  xmap ag <Plug>(coc-git-chunk-outer)

  nnoremap <silent> q/ :<C-U>CocList<CR>
  nnoremap <silent> <C-W>/ :<C-U>CocList windows<CR>
  nnoremap <silent> <C-W>? :<C-U>CocList buffers<CR>
  nnoremap <silent> q: :<C-U>CocList cmdhistory<CR>
  nnoremap <silent> q? :<C-U>CocList searchhistory<CR>
  nnoremap <silent> q` :<C-U>CocList marks<CR>
  nnoremap <silent> q' :<C-U>CocList quickfix<CR>
  nnoremap <silent> q" :<C-U>CocList locationlist<CR>
  nnoremap <silent> q[ :<C-U>CocList commands<CR>
  nnoremap <silent> q] :<C-U>CocList diagnostics<CR>
  nnoremap <silent> q; :<C-U>CocList changes<CR>
  nnoremap <silent> q, :<C-U>CocList maps<CR>
  nnoremap <silent> q- :<C-U>CocList colors<CR>
  nnoremap <silent> q= :<C-U>CocList filetypes<CR>
  nnoremap <silent> q_ :<C-U>CocList -A --normal yank<CR>
  nnoremap <silent> z/ :<C-U>CocList files<CR>
  nnoremap <silent> z? :<C-U>CocList mru<CR>
  nnoremap <silent> z; :<C-U>CocList -I -A grep<CR>
  nnoremap <silent> z, :<C-U>CocList -I -A words<CR>
  nnoremap <silent> z: :<C-U>CocList -I -A lines<CR>
  nnoremap <silent> z' :<C-U>CocList -I translators<CR>
  nnoremap <silent> g[ :<C-U>set operatorfunc=init#init#coc#grep<CR>g@
  xnoremap <silent> g[ :<C-U>call init#init#coc#grep(visualmode())<CR>
endfunction

function! init#coc#imap() abort
  inoremap <silent><expr> <M-p> "\<C-R>=coc#float#scroll(0)\<cr>"
  inoremap <silent><expr> <M-n> "\<C-R>=coc#float#scroll(1)\<cr>"
  inoremap <silent><expr> <C-M-p> coc#pum#visible() ? coc#pum#scroll(0) : "\<PageUp>"
  inoremap <silent><expr> <C-M-n> coc#pum#visible() ? coc#pum#scroll(1) : "\<PageDown>"
  inoremap <silent><expr> <C-CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-Y>"
  inoremap <silent><expr> <C-\> coc#pum#visible() ? coc#pum#cancel() : "\<C-E>"
  inoremap <C-^> <C-O>:<C-U>CocCommand rime.toggle<CR><C-O>:call CocAction('toggleSource', 'word')<CR>
endfunction

augroup init#coc
  autocmd!
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " https://github.com/neoclide/coc-highlight/issues/36
  " autocmd CursorHold * call CocActionAsync('highlight')
  autocmd VimLeavePre * CocCommand mru.validate
  autocmd VimLeavePre * if get(g:, 'coc_process_pid', 0)
        \ | call system('kill -9 '.g:coc_process_pid) | endif
  autocmd SourcePost rsi.vim call init#coc#imap()
augroup END
" ex: path=.,$XDG_CONFIG_HOME/coc/extensions/node_modules
