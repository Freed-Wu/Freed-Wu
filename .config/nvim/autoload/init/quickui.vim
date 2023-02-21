function! init#quickui#process(menu) abort
  let l:menu = map(a:menu, {_, v -> [v[0]] + [get(v, 1, substitute(v[0], '&', '', 'g'))]})
  let l:menu = map(l:menu, {_, v -> v + [get(v, 1)]})
  return l:menu
endfunction

""
" assets/json/menu
function! init#quickui#install(menu_name, json_name) abort
  let l:menu = init#get_json('menu/' . a:json_name)
  let l:menu = init#quickui#process(l:menu)
  call quickui#menu#install(a:menu_name, l:menu)
endfunction

""
" assets/json/context/normal/global.json
"
" assets/json/context/visual/global.json
function! init#quickui#source() abort
  " vim-troll-stopper renders 3's =
  let g:quickui_border_style = 2
  nnoremap <silent> <Space> :<C-U>call quickui#menu#open()<CR>
  xnoremap <silent> <Space> :<C-U>call quickui#menu#open()<CR>
  nnoremap <silent> , :<C-U>call init#init#quickui#install('normal/global')<CR>
  xnoremap <silent> , :<C-U>call init#init#quickui#install('visual/global')<CR>
endfunction

function! init#quickui#post_source() abort
  let g:quickui_show_tip = 1
  call init#quickui#install('&File', 'file')
  call init#quickui#install('&Edit', 'edit')
  call init#quickui#install('&View', 'view')
  call init#quickui#install('&Git', 'git')
  call init#quickui#install('&Z-fold', 'fold')
  call init#quickui#install('&Plugins', 'plugin')
endfunction
