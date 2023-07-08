" https://github.com/SeniorMars/coc-typst/issues/1
let g:init#init#install#coc = [
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
      \
      \ 'coc-dictionary', 'coc-tag', 'coc-word', 'coc-emoji', 'coc-syntax',
      \
      \ 'coc-copilot',
      \
      \ '@yaegassy/coc-marksman', 'coc-webview',
      \ 'coc-markdown-preview-enhanced', 'coc-esbonio',
      \ 'coc-texlab', 'coc-bibtex', 'coc-cmake',
      \ 'coc-json', 'coc-yaml', 'coc-toml', 'coc-xml', 'coc-svg', 'coc-html',
      \ 'coc-clang-format-style-options', 'coc-docker',
      \ 'coc-sql', 'coc-sh', 'coc-vimlsp', 'coc-perl',
      \ 'coc-jedi', 'coc-pyright', 'coc-lua', 'coc-solargraph', 'coc-clangd',
      \ ]
" tabnine don't support android
if $PREFIX !=# '/data/data/com.termux/files/usr'
  let g:init#init#install#coc += ['coc-tabnine']
endif
