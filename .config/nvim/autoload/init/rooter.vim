function! init#rooter#source() abort
  let g:rooter_targets = ['!/tmp/*', '/', '*']
  " https://github.com/airblade/vim-rooter/issues/124
  let g:rooter_patterns = ['.git', '.svn', '.hg', '>.config', '>share',
        \ 'Cargo.toml', 'pyproject.toml', 'Project.toml', 'lux.toml',
        \ 'llmk.toml', 'latexmkrc',
        \ 'package.json', 'manifest.json', 'metadata.json', 'app.json']
  let g:rooter_change_directory_for_non_project_files = 'current'
endfunction
