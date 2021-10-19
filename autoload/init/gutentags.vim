function! init#gutentags#source() abort
  let g:gutentags_cache_dir = $XDG_CACHE_HOME . '/nvim/vim-gutentags'
  let g:gutentags_exclude_project_root = [$HOME, '/usr/local', '/opt/homebrew',
        \ '/home/linuxbrew/.linuxbrew']
  let g:gutentags_define_advanced_commands = 1
  let g:gutentags_file_list_command = {
        \ 'markers': {
          \ '.git': 'git ls-files',
          \ '.hg': 'hg files',
          \ },
          \ }
endfunction
