function! init#rooter#source() abort
  " https://github.com/airblade/vim-rooter/issues/124
  let g:rooter_patterns = ['.git', '>.config', '>share', 'pyproject.toml', 'package.json']
  let g:rooter_change_directory_for_non_project_files = 'current'
endfunction
