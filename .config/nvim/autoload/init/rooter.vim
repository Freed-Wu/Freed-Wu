function! init#rooter#source() abort
  let g:rooter_targets = ['!/tmp/*', '/', '*']
  " https://github.com/airblade/vim-rooter/issues/124
  let g:rooter_patterns = ['.git', '>.config', '>share', 'pyproject.toml', 'package.json', 'lux.toml']
  let g:rooter_change_directory_for_non_project_files = 'current'
endfunction
