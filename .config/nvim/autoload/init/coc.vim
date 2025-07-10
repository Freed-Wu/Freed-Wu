scriptencoding utf-8
function! init#coc#source() abort
  set formatexpr=CocAction('formatSelected')

  let g:coc_global_extensions = [
        \ 'coc-highlight',
        \
        \ 'coc-tasks', 'coc-vimtex', 'coc-emmet', 'coc-calc', 'coc-translator',
        \ 'coc-leetcode',
        \
        \ 'coc-marketplace', 'coc-lists', 'coc-yank', 'coc-gist',
        \ 'coc-gitignore', 'coc-license', 'coc-nerdfont',
        \
        \ 'coc-dash-complete', 'coc-dot-complete', 'coc-just-complete',
        \ 'coc-dictionary', 'coc-tag', 'coc-word', 'coc-emoji',
        \ 'coc-emoji-shortcodes', 'coc-ci', 'coc-snippets',
        \
        \ 'coc-copilot', 'coc-diagnostic',
        \
        \ 'coc-spell-checker', 'write-good-linter', 'coc-markdownlint',
        \ 'coc-ltex', 'coc-pydocstring',
        \
        \ '@yaegassy/coc-marksman', 'coc-webview',
        \ 'coc-markdown-preview-enhanced', 'coc-esbonio', 'coc-graphviz',
        \ 'coc-texlab', 'coc-bibtex', 'coc-cmake', 'coc-mlir', 'coc-nix',
        \ 'coc-json', 'coc-yaml', 'coc-toml', 'vscode-jq', 'coc-awk',
        \ 'coc-xml', 'coc-svg', 'coc-html', 'coc-css',
        \ 'coc-docker', 'coc-sql', 'coc-db', 'coc-bitbake', 'coc-meson',
        \ 'coc-sh', 'coc-vimlsp', 'coc-perl', 'coc-tsserver', 'coc-biome',
        \ '@yaegassy/coc-ruff', 'coc-pyright', 'coc-lua', 'coc-solargraph',
        \ 'coc-clangd', 'hyuga-vscode-client', 'coc-alex'
        \ ]
  " tabnine don't support android
  if $PREFIX !=# '/data/data/com.termux/files/usr'
    let g:coc_global_extensions += ['coc-tabnine']
  endif
  if !has('win32')
    let g:coc_global_extensions += ['coc-git']
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
        \ 'text': 'plaintext',
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
        \ 'expect': 'tcl',
        \ 'xsct': 'tcl',
        \ 'xdc': 'tcl',
        \ 'swig': 'c',
        \ 'lex': 'c',
        \ 'yacc': 'c',
        \ 'gel': 'cpp',
        \ 'lnk': 'c',
        \ 'teal': 'lua',
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
  inoremap <silent><expr> <M-p> "\<C-R>=coc#float#scroll(0)\<CR>"
  inoremap <silent><expr> <M-n> "\<C-R>=coc#float#scroll(1)\<CR>"
  inoremap <silent><expr> <C-P> coc#pum#visible() ? coc#pum#prev(1) : pumvisible() ? "\<C-P>" : "\<Up>"
  inoremap <silent><expr> <C-N> coc#pum#visible() ? coc#pum#next(1) : pumvisible() ? "\<C-N>" : "\<Down>"
  inoremap <silent><expr> <C-M-p> coc#pum#visible() ? coc#pum#scroll(0) : "\<PageUp>"
  inoremap <silent><expr> <C-M-n> coc#pum#visible() ? coc#pum#scroll(1) : "\<PageDown>"
  inoremap <silent><expr> <C-CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-Y>"
  inoremap <silent><expr> <C-Z> coc#pum#visible() ? coc#pum#cancel() : "\<C-E>"
endfunction

augroup init#coc
  autocmd!
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " https://github.com/neoclide/coc-highlight/issues/36
  " autocmd CursorHold * call CocActionAsync('highlight')
  autocmd VimLeavePre * if exists(':CocCommand')
        \ | CocCommand mru.validate
        \ | endif
  autocmd SourcePost rsi.vim call init#coc#imap()
augroup END
" ex: path=,.,$XDG_CONFIG_HOME/coc/extensions/node_modules
