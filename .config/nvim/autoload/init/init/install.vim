" https://github.com/SeniorMars/coc-typst/issues/1
" https://github.com/neoclide/coc-yaml/issues/76
let g:init#init#install#coc = [
      \ 'coc-highlight',
      \
      \ 'coc-ci',
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
      \
      \ 'coc-dictionary', 'coc-tag', 'coc-word', 'coc-emoji', 'coc-syntax',
      \
      \ 'coc-copilot',
      \
      \ '@yaegassy/coc-marksman', 'coc-webview',
      \ 'coc-markdown-preview-enhanced', 'coc-esbonio',
      \ 'coc-texlab', 'coc-bibtex', 'coc-cmake',
      \ 'coc-json', 'coc-yaml', 'coc-toml',
      \ 'coc-xml', 'coc-svg', 'coc-html', 'coc-css',
      \ 'coc-docker',
      \ 'coc-sql', 'coc-sh', 'coc-vimlsp', 'coc-perl',
      \ 'coc-jedi', 'coc-pyright', 'coc-lua', 'coc-solargraph', 'coc-clangd',
      \ ]
" don't support android
" https://github.com/tonyfettes/coc-rime/issues/6
if $PREFIX !=# '/data/data/com.termux/files/usr'
  let g:init#init#install#coc += ['coc-tabnine', 'coc-rime']
endif
" ex: path=,.,$XDG_CONFIG_HOME/coc/extensions/node_modules
