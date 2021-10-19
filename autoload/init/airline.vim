scriptencoding utf-8
function! init#airline#source() abort
  let g:airline_highlighting_cache = 1
  let g:airline_focuslost_inactive = 1
  let g:airline_powerline_fonts = 1
  let g:airline_section_c_only_filename = 0
  let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols = {
        \ 'linenr': '',
        \ 'maxlinenr': '',
        \ 'colnr': '',
        \ 'paste': '',
        \ 'notexists': '?',
        \ 'dirty': '!',
        \ 'spell': '',
        \ 'keymap': '',
        \ 'whitespace': '',
        \ }
  let g:airline_mode_map = {
        \ '__'   : '-',
        \ 'c'    : ':',
        \ 'i'    : '▏',
        \ 'ic'   : '≣',
        \ 'ix'   : '=',
        \ 'n'    : '█',
        \ 'ni'   : '▌',
        \ 'no'   : '▄',
        \ 'multi': '…',
        \ 'R'    : '▁',
        \ 'Rv'   : '∿',
        \ 's'    : '→',
        \ 'S'    : '↓',
        \ "\x13"   : '↘',
        \ 't'    : '!',
        \ 'v'    : '▶',
        \ 'V'    : '▼',
        \ "\x16"   : '◆',
        \ }
  if !has('unix') || has('unix') && exists('*trim')
    let g:airline_filetype_overrides = {
            \ 'startify': ['startify', '%{fnamemodify(getcwd(), ":~")} '
            \ . g:airline_left_alt_sep . ' %{wifi#component()}'],
            \ }
  else
    let g:airline_filetype_overrides = {
          \ 'startify': ['startify', '%{fnamemodify(getcwd(), ":~")}'],
          \ }
  endif

  let g:airline#extensions#ale#error_symbol = '✗'
  let g:airline#extensions#ale#warning_symbol = '⚠'
  let g:airline#extensions#ale#open_lnum_symbol = '☰'
  let g:airline#extensions#ale#close_lnum_symbol = ''

  let g:airline#extensions#coc#error_symbol = '✗'
  let g:airline#extensions#coc#warning_symbol = '⚠'

  let g:airline#extensions#quickfix#quickfix_text = ''
  let g:airline#extensions#quickfix#location_text = ''

  let g:airline#extensions#hunks#coc_git = 1

  let g:airline#extensions#vimtex#left = ''
  let g:airline#extensions#vimtex#right = ''
  let g:airline#extensions#vimtex#sub_main = '☆'
  let g:airline#extensions#vimtex#sub_local = ''
  let g:airline#extensions#vimtex#compiled = '✔'
  let g:airline#extensions#vimtex#continuous = ''
  let g:airline#extensions#vimtex#viewer = ''

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_close_button = 1
  let g:airline#extensions#tabline#buffers_label = ''
  let g:airline#extensions#tabline#tabs_label = ''
  let g:airline#extensions#tabline#close_symbol = '⌫'
  let g:airline#extensions#tabline#overflow_marker = '…'
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': '⓪ ',
        \ '1': '① ',
        \ '2': '② ',
        \ '3': '③ ',
        \ '4': '④ ',
        \ '5': '⑤ ',
        \ '6': '⑥ ',
        \ '7': '⑦ ',
        \ '8': '⑧ ',
        \ '9': '⑨ ',
        \ }
  nmap <C-W>1 <Plug>AirlineSelectTab1
  nmap <C-W>2 <Plug>AirlineSelectTab2
  nmap <C-W>3 <Plug>AirlineSelectTab3
  nmap <C-W>4 <Plug>AirlineSelectTab4
  nmap <C-W>5 <Plug>AirlineSelectTab5
  nmap <C-W>6 <Plug>AirlineSelectTab6
  nmap <C-W>7 <Plug>AirlineSelectTab7
  nmap <C-W>8 <Plug>AirlineSelectTab8
  nmap <C-W>9 <Plug>AirlineSelectTab9
  nmap <C-W>0 <Plug>AirlineSelectTab0
  nmap <C-W>, <Plug>AirlineSelectPrevTab
  nmap <C-W>; <Plug>AirlineSelectNextTab

  let g:airline#extensions#wordcount#filetypes =['all']
  let g:airline#extensions#wordcount#formatter#default#fmt = '%s'
  let g:airline#extensions#wordcount#formatter#default#fmt_short = '%s'

  let g:airline#extensions#capslock#symbol = '↑'

  let g:airline#extensions#whitespace#long_format = '…%s'
  let g:airline#extensions#whitespace#trailing_format = '_%s'
  let g:airline#extensions#whitespace#mixed_indent_format = '█%s'
  let g:airline#extensions#whitespace#mixed_indent_file_format = '⇆%s'
  let g:airline#extensions#whitespace#conflicts_format = '✗%s'

  let g:airline#extensions#battery#enabled = 1

  let g:airline#extensions#localsearch#inverted = 1

  let g:airline#extensions#scrollbar#enabled = 1

  let g:airline#extensions#windowswap#indicator_text = '✂'

  " https://github.com/vim-airline/vim-airline/issues/2425
  let g:airline#extensions#zoomwintab#status_zoomed_in = '🔍'
endfunction
