scriptencoding utf-8

function! s:close() abort
  if executable('xdotool') && exists('b:vimtex') && exists('b:vimtex.viewer')
        \ && b:vimtex.viewer.xwin_id > 0
    call system(join(['xdotool windowclose', b:vimtex.viewer.xwin_id]))
  endif
endfunction

function! init#vimtex#source() abort
  let g:vimtex_delim_toggle_mod_list = [
        \ ['\bigl', '\bigr'],
        \ ['\Bigl', '\Bigr'],
        \ ['\biggl', '\biggr'],
        \ ['\Biggl', '\Biggr'],
        \]
  let g:vimtex_doc_handlers = ['init#init#vimtex#texdoc']
  let g:vimtex_env_change_autofill = 1
  let g:vimtex_fold_bib_enabled = 1
  let g:vimtex_fold_levelmarker = ''
  let g:vimtex_format_enabled = 1
  " ` will avoid markdown's code quotation
  let g:vimtex_imaps_leader = g:maplocalleader
  let g:vimtex_indent_delims = {
        \ 'open': ['{', '['],
        \ 'close': ['}', ']'],
        \ 'close_indented': 0,
        \ 'include_modified_math': 1,
        \ }
  " chktexrc VerbEnvir
  let g:vimtex_indent_ignored_envs = [
        \ 'document',
        \
        \ 'verbatim', 'comment', 'verbatimtab', 'rawhtml', 'errexam', 'texdraw',
        \ 'filecontents', 'minted', 'lstlisting', 'IPA',
        \
        \ 'markdown',
        \
        \ 'Verbatim',
        \
        \ 'pycode', 'pysub', 'pyverbatim', 'pyblock', 'pyconsole',
        \ 'pythontexcustomcode',
        \ ]
  let g:vimtex_mappings_disable = {
        \ 'n': ['<F7>', 'tsc', 'tse', 'tsd', 'tsD', 'tsf'],
        \ 'x': ['<F7>', 'tsd', 'tsD', 'tsf'],
        \ 'i': ['<F7>'],
        \ }
  let g:vimtex_mappings_override_existing = 1
  let g:vimtex_syntax_conceal = {
        \ 'accents': 1,
        \ 'cites': 1,
        \ 'fancy': 1,
        \ 'greek': 1,
        \ 'math_bounds': 1,
        \ 'math_delimiters': 1,
        \ 'math_fracs': 1,
        \ 'math_super_sub': 1,
        \ 'math_symbols': 1,
        \ 'sections': 1,
        \ 'styles': 1,
        \ }
  let g:vimtex_toc_config = {
        \ 'fold_enable': 1,
        \ 'hotkeys_enabled': 1,
        \ 'hotkeys': 'abcdefghijklmnopgrstuvwxyz',
        \ 'hotkeys_leader': g:maplocalleader,
        \ 'indent_levels': 1,
        \ 'show_help': 0,
        \ 'split_pos': 'vert :rightbelow',
        \ 'split_width': &columns / 4,
        \ 'layer_status': {
          \ 'content': 1,
          \ 'label': 0,
          \ 'todo': 0,
          \ 'include': 0,
          \ },
          \ 'layer_keys': {
            \ 'content': '=c',
            \ 'label': '=l',
            \ 'todo': '=t',
            \ 'include': '=i',
            \ }
            \ }
  if get(g:, 'vimtex_latexmk_background') !=# 'latexrun'
    let g:vimtex_view_use_temp_files = 1
  endif
  if executable('zathura')
    let g:vimtex_view_method = 'zathura'
  elseif executable('okular')
    let g:vimtex_view_general_viewer = 'okular'
    let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
  elseif executable('SumatraPDF')
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options =
          \ '-reuse-instance -forward-search @tex @line @pdf'
          \ . ' -inverse-search "gvim --servername '.v:servername
          \ . ' --remote-send \"^<C-\^>^<C-n^>'
          \ . ':drop \%f^<CR^>:\%l^<CR^>:normal\! zzzv^<CR^>'
          \ . ':execute ''drop'' fnameescape(''\%f'')^<CR^>'
          \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
          \ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'
  endif
  let g:vimtex_compiler_latexmk_engines = {
        \ '_': '-xelatex',
        \ }
endfunction

augroup init#vimtex
  autocmd!
  autocmd User VimtexEventQuit call s:close()
  autocmd User VimtexEventTocCreated setfiletype latextoc
        \| call b:toc.set_syntax()
augroup END
