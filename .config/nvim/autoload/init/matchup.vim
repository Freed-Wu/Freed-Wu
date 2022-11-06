function! init#matchup#source() abort
  let g:matchup_transmute_enabled = 1
  let g:matchup_surround_enabled = 1
  let g:matchup_override_vimtex = 1
  if exists('*nvim_open_win') || exists('*popup_create')
    let g:matchup_matchparen_offscreen = {
          \ 'method': 'popup',
          \ }
  endif
endfunction
