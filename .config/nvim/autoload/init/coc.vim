scriptencoding utf-8
function! init#coc#source() abort
  set formatexpr=CocAction('formatSelected')

  " https://github.com/SeniorMars/coc-typst/issues/1
  " https://github.com/neoclide/coc-yaml/issues/76
  let g:coc_global_extensions = [
        \ 'coc-highlight',
        \
        \ 'coc-ci',
        \
        \ 'coc-pydocstring',
        \
        \ 'coc-diagnostic', 'coc-spell-checker', 'coc-markdownlint', 'coc-ltex',
        \
        \ 'coc-prettier',
        \
        \ 'coc-tasks', 'coc-vimtex', 'coc-emmet', 'coc-calc',
        \ 'coc-snippets', 'coc-translator', 'coc-zi',
        \
        \ 'coc-marketplace', 'coc-lists', 'coc-yank', 'coc-git', 'coc-gist',
        \ 'coc-gitignore', 'coc-license',
        \
        \ 'coc-dash-complete', 'coc-dot-complete', 'coc-just-complete',
        \
        \ 'coc-dictionary', 'coc-tag', 'coc-word', 'coc-emoji',
        \ 'coc-emoji-shortcodes', 'coc-syntax',
        \
        \ 'coc-copilot', 'coc-leetcode',
        \
        \ '@yaegassy/coc-marksman', 'coc-webview',
        \ 'coc-markdown-preview-enhanced', 'coc-esbonio', 'coc-graphviz',
        \ 'coc-texlab', 'coc-bibtex', 'coc-cmake', 'coc-mlir', 'coc-nix',
        \ 'coc-json', 'coc-yaml', 'coc-toml', 'coc-jq',
        \ 'coc-xml', 'coc-svg', 'coc-html', 'coc-css', 'coc-typst',
        \ 'coc-docker', 'coc-sql', 'coc-db', 'coc-bitbake', 'coc-meson',
        \ 'coc-sh', 'coc-vimlsp', 'coc-perl', 'coc-tsserver', 'coc-eslint',
        \ '@yaegassy/coc-ruff', 'coc-pyright', 'coc-lua', 'coc-solargraph',
        \ 'coc-clangd',
        \ ]
  " https://github.com/tonyfettes/coc-rime/issues/6
  " don't support android
  if $PREFIX !=# '/data/data/com.termux/files/usr'
    let g:coc_global_extensions += ['coc-tabnine']
  endif
  if !executable('fcitx5-remote')
    let g:coc_global_extensions += ['coc-rime']
  endif

  let g:coc_snippet_next = '<Tab>'
  let g:coc_snippet_prev = '<S-Tab>'
  let g:coc_status_error_sign = '✗'
  let g:coc_status_warning_sign = ''
  " https://github.com/neoclide/coc.nvim/issues/4282
  " https://github.com/neoclide/coc.nvim/discussions/4892
  " ~/.local/share/nvim/repos/github.com/nvim-treesitter/nvim-treesitter/lua/nvim-treesitter/parsers.lua
  " https://code.visualstudio.com/docs/languages/identifiers#_known-language-identifiers
  let g:coc_filetype_map = {
        \ 'bash': 'sh',
        \ 'PKGBUILD': 'sh',
        \ 'ebuild': 'sh',
        \ 'apkbuild': 'sh',
        \ 'zsh': 'sh',
        \ 'systemverilog': 'verilog',
        \ 'pandoc': 'markdown',
        \ 'rmd': 'markdown',
        \ 'quarto': 'markdown',
        \ 'tutor': 'markdown',
        \ 'dosini': 'ini',
        \ 'confini': 'ini',
        \ 'svg': 'xml',
        \ 'xsd': 'xml',
        \ 'xslt': 'xml',
        \ 'mysql': 'sql',
        \ 'sbt': 'scala',
        \ 'eelixir': 'elixir',
        \ 'neomuttrc': 'muttrc',
        \ 'automake': 'make',
        \ 'gyp': 'python',
        \ }
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
  nmap [d <Plug>(coc-diagnostic-prev)
  nmap ]d <Plug>(coc-diagnostic-next)
  nmap [D <Plug>(coc-diagnostic-prev-error)
  nmap ]D <Plug>(coc-diagnostic-next-error)
  nnoremap <silent> gd :<C-U>call init#init#coc#action('definition', 'jumpDefinition', 'gd')<CR>
  nnoremap <silent> gD :<C-U>call init#init#coc#action('declaration', 'jumpDeclaration', 'gD')<CR>
  nnoremap <silent> 1gd :<C-U>call init#init#coc#action('typeDefinition', 'jumpTypeDefinition', '1gd')<CR>
  nnoremap <silent> 1gD :<C-U>call init#init#coc#action('implementation', 'jumpImplementation', '1gD')<CR>
  nnoremap <silent> [r :<C-U>call init#init#coc#action('reference', 'jumpUsed', '1gD')<CR>
  nnoremap <silent> ]r :<C-U>call init#init#coc#action('reference', 'jumpReference', '1gD')<CR>
  nnoremap <silent> gr :<C-U>call init#init#coc#action('rename', 'refactor', 'gr')<CR>
  nnoremap <silent> gR :<C-U>call init#init#coc#action('rename', 'rename', 'gR')<CR>
  nnoremap <silent> K :<C-U>call init#init#coc#action('hover', 'doHover', 'K')<CR>
  nnoremap gK K
  xnoremap gK K
  " https://github.com/neoclide/coc.nvim/issues/4831
  nnoremap <silent> gx :<C-U>call init#init#coc#openLink()<CR>

  nmap <C-W>gd <C-W>s<Plug>(coc-definition)
  nmap <C-W>gD <C-W>s<Plug>(coc-declaration)

  nmap gq <plug>(coc-format-selected)
  xnoremap <silent> gq :<C-U>call init#init#coc#format(v:true)<CR>
  nnoremap <silent> gqq :<C-U>call init#init#coc#format(v:false)<CR>

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
  nnoremap <silent> <C-W>d :<C-U>CocList diagnostics<CR>
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
  if index(g:coc_global_extensions, 'coc-rime') != -1
    inoremap <C-^> <C-O>:<C-U>CocCommand rime.toggle<CR>
  else
    inoremap <C-^> <Cmd>lua require'fcitx5-ui'.toggle()<CR><Cmd>call init#init#buffer#map()<CR>
  endif
endfunction

augroup init#coc
  autocmd!
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " https://github.com/neoclide/coc-highlight/issues/36
  " autocmd CursorHold * call CocActionAsync('highlight')
  autocmd VimLeavePre * if exists(':CocCommand')
        \ | CocCommand mru.validate
        \ | endif
  autocmd VimLeavePre * if get(g:, 'coc_process_pid', 0)
        \ | call system('kill -9 '.g:coc_process_pid)
        \ | endif
  autocmd SourcePost rsi.vim call init#coc#imap()
augroup END
" ex: path=,.,$XDG_CONFIG_HOME/coc/extensions/node_modules
