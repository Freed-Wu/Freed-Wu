scriptencoding utf-8
function! s:format(str) abort
  let l:str = a:str
  for [k, v] in items(extend(copy(g:which_key_display_names), {' ': ' '}))
    let l:str = substitute(l:str, '\c' . k, v, 'g')
  endfor
  let l:str = substitute(l:str, '.\{40}\zs.*', '…', '')
  return l:str
endfunction

function! s:which_key() abort
  " https://github.com/liuchengxu/vim-which-key/issues/200
  " don't use <wait>
  nnoremap <silent> <Leader> :<C-U>WhichKey '<Leader>'<CR>
  xnoremap <silent> <Leader> :<C-U>WhichKeyVisual '<Leader>'<CR>
  nnoremap <silent> <LocalLeader> :<C-U>WhichKey '<LocalLeader>'<CR>
  xnoremap <silent> <LocalLeader> :<C-U>WhichKeyVisual '<LocalLeader>'<CR>
  nnoremap <silent> z :<C-U>WhichKey 'z'<CR>
  xnoremap <silent> z :<C-U>WhichKeyVisual 'z'<CR>
  nnoremap <silent> Z :<C-U>WhichKey 'Z'<CR>
  xnoremap <silent> Z :<C-U>WhichKeyVisual 'Z'<CR>
  nnoremap <silent> g :<C-U>WhichKey 'g'<CR>
  xnoremap <silent> g :<C-U>WhichKeyVisual 'g'<CR>
  nnoremap <silent> <C-W> :WhichKey '<lt>C-w>'<CR>
  xnoremap <silent> <C-W> :WhichKeyVisual '<lt>C-w>'<CR>
  " override targets.vim
  xnoremap <silent> i :<C-U>WhichKeyVisual 'i'<CR>
  xnoremap <silent> a :<C-U>WhichKeyVisual 'a'<CR>
  xnoremap <silent> I :<C-U>WhichKeyVisual 'I'<CR>
  xnoremap <silent> A :<C-U>WhichKeyVisual 'A'<CR>
endfunction

function! init#which_key#source() abort
  let g:which_key_fallback_to_native_key = 1
  let g:which_key_hspace = 1
  " dein.vim will add some maps contain \x15
  let g:which_key_display_names = {
        \ ' ': '█',
        \ '<Space>': '█',
        \ '<SID>': '',
        \ '<Bar>': '|',
        \ '<Plug>': '',
        \ '<CR>': '⏎',
        \ '<TAB>': '⇆',
        \ '<C-I>': '⇆',
        \ '<C-R>': '✂',
        \ '<C-U>': '✗',
        \ "\x15": '✗',
        \ '<BS>': '⌫',
        \ '<DEL>': '⌦',
        \ '<Left>': '←',
        \ '<Right>': '→',
        \ '<Up>': '↑',
        \ '<Down>': '↓',
        \ }
  let g:WhichKeyFormatFunc = function('s:format')
  let g:which_key_map_localleader = {
        \ 'name': '+local-map',
        \ }
  " noVi {{{1 "
  nnoremap go go
  xnoremap go go
  nnoremap g<C-G> g<C-G>
  xnoremap g<C-G> g<C-G>
  " 1}}} noVi "
  " modify {{{1 "
  xnoremap iw iw
  xnoremap aw aw
  xnoremap iW iW
  xnoremap aW aW
  " vim-textobj-sentence will map is, as
  xnoremap ip ip
  xnoremap ap ap

  " vim-xkbswitch will define g<C-H>
  nnoremap gQ gQ
  nnoremap gw gw
  xnoremap gw gw
  nnoremap gI gI
  xnoremap gI gI
  xnoremap gI I
  xnoremap gA A
  " 1}}} modify "
  " markMoveCursor {{{1 "
  onoremap [' ['
  onoremap [` [`
  onoremap ]' ]'
  onoremap ]` ]`
  xnoremap [' ['
  xnoremap [` [`
  xnoremap ]' ]'
  xnoremap ]` ]`
  nnoremap g` g`
  xnoremap g` g`
  nnoremap g' g'
  xnoremap g' g'
  " 1}}} markMoveCursor "
  " charMoveCursor {{{1 "
  nnoremap g0 g0
  xnoremap g0 g0
  onoremap g0 g0
  nnoremap g_ g_
  xnoremap g_ g_
  onoremap g_ g_
  nnoremap gm gm
  xnoremap gm gm
  onoremap gm gm
  " 1}}} charMoveCursor "
  " wordMoveCursor {{{1 "
  nnoremap ge ge
  nnoremap gE gE
  xnoremap ge ge
  xnoremap gE gE
  onoremap ge ge
  onoremap gE gE
  " 1}}} wordMoveCursor "
  " lineMoveCursor {{{1 "
  nnoremap gj gj
  nnoremap gk gk
  xnoremap gj gj
  xnoremap gk gk
  onoremap gj gj
  onoremap gk gk
  " 1}}} lineMoveCursor "
  " scrollMoveCursor {{{1 "
  nnoremap zt zt
  nnoremap zb zb
  nnoremap zz zz
  nnoremap zT z+
  nnoremap zB z-
  nnoremap zZ z.
  xnoremap zt zt
  xnoremap zb zb
  xnoremap zz zz
  xnoremap zT z+
  xnoremap zB z-
  xnoremap zZ z.
  " 1}}} scrollMoveCursor "
  " wrapMoveCursor {{{1 "
  nnoremap zh zh
  nnoremap zl zl
  nnoremap zH zH
  nnoremap zL zL
  nnoremap zs zs
  nnoremap ze ze
  xnoremap zh zh
  xnoremap zl zl
  xnoremap zH zH
  xnoremap zL zL
  xnoremap zs zs
  xnoremap ze ze
  onoremap zh zh
  onoremap zl zl
  onoremap zH zH
  onoremap zL zL
  onoremap zs zs
  onoremap ze ze
  " 1}}} wrapMoveCursor "
  " searchMoveCursor {{{1 "
  nnoremap gn gn
  nnoremap gN gN
  xnoremap gn gn
  xnoremap gN gN
  onoremap gn gn
  onoremap gN gN
  " 1}}} searchMoveCursor "
  " changeMoveCursor {{{1 "
  nnoremap g; g;
  nnoremap g, g,
  xnoremap g; g;
  xnoremap g, g,
  " 1}}} changeMoveCursor "
  " featureMoveCursor {{{1 "
  nnoremap [# [#
  nnoremap ]# ]#
  xnoremap [# [#
  xnoremap ]# ]#
  onoremap [# [#
  onoremap ]# ]#
  nnoremap [/ [/
  nnoremap ]/ ]/
  xnoremap [/ [/
  xnoremap ]/ ]/
  onoremap [/ [/
  onoremap ]/ ]/
  nnoremap [c [c
  nnoremap ]c ]c
  xnoremap [c [c
  xnoremap ]c ]c
  nnoremap [s [s
  nnoremap ]s ]s
  nnoremap [S [S
  nnoremap ]S ]S
  xnoremap [s [s
  xnoremap ]s ]s
  xnoremap [S [S
  xnoremap ]S ]S
  onoremap [s [s
  onoremap ]s ]s
  onoremap [S [S
  onoremap ]S ]S
  onoremap [m [m
  onoremap ]m ]m
  onoremap [M [M
  onoremap ]M ]M
  nnoremap [( [(
  nnoremap [) [)
  nnoremap ]( ](
  nnoremap ]) ])
  xnoremap [( [(
  xnoremap [) [)
  xnoremap ]( ](
  xnoremap ]) ])
  onoremap [( v[(
  onoremap [) v[)
  onoremap ]( v](
  onoremap ]) v])
  nnoremap [{ [{
  nnoremap [} [}
  nnoremap ]{ ]{
  nnoremap ]} ]}
  xnoremap [{ [{
  xnoremap [} [}
  xnoremap ]{ ]{
  xnoremap ]} ]}
  onoremap [{ v[{
  onoremap [} v[}
  onoremap ]{ v]{
  onoremap ]} v]}
  nnoremap [[ [[
  nnoremap ]] ]]
  nnoremap [] []
  nnoremap ][ ][
  xnoremap [[ [[
  xnoremap ]] ]]
  xnoremap [] []
  xnoremap ][ ][
  onoremap [[ [[
  onoremap ]] ]]
  onoremap [] []
  onoremap ][ ][
  " 1}}} featureMoveCursor "
  " show {{{1 "
  nnoremap [i [i
  nnoremap ]i ]i
  nnoremap [I [I
  nnoremap ]I ]I
  nnoremap [<C-I> [<C-I>
  nnoremap ]<C-I> ]<C-I>
  nnoremap [<C-D> [<C-D>
  nnoremap ]<C-D> ]<C-D>
  " 1}}} show "
  " tabMoveCursor {{{1 "
  nnoremap gt gt
  nnoremap gT gT
  nnoremap g<Tab> g<Tab>
  " 1}}} tabMoveCursor "
  " windowMoveCursor {{{1 "
  nnoremap <C-W>j <C-W>j
  nnoremap <C-W>k <C-W>k
  nnoremap <C-W>h <C-W>h
  nnoremap <C-W>l <C-W>l
  xnoremap <C-W>j <C-W>j
  xnoremap <C-W>k <C-W>k
  xnoremap <C-W>h <C-W>h
  xnoremap <C-W>l <C-W>l
  nnoremap <C-W>w <C-W>w
  nnoremap <C-W>W <C-W>W
  nnoremap <C-W>t <C-W>t
  nnoremap <C-W>b <C-W>b
  nnoremap <C-W>r <C-W>r
  nnoremap <C-W>R <C-W>R
  xnoremap <C-W>w <C-W>w
  xnoremap <C-W>W <C-W>W
  xnoremap <C-W>t <C-W>t
  xnoremap <C-W>b <C-W>b
  xnoremap <C-W>r <C-W>r
  xnoremap <C-W>R <C-W>R
  nnoremap <C-W>x <C-W>x
  xnoremap <C-W>x <C-W>x
  " 1}}} windowMoveCursor "
  " cursorMoveWindow {{{1 "
  nnoremap <C-W>J <C-W>J
  nnoremap <C-W>K <C-W>K
  nnoremap <C-W>H <C-W>H
  nnoremap <C-W>L <C-W>L
  xnoremap <C-W>J <C-W>J
  xnoremap <C-W>K <C-W>K
  xnoremap <C-W>H <C-W>H
  xnoremap <C-W>L <C-W>L
  " 1}}} cursorMoveWindow "
  " windowModify {{{1 "
  nnoremap <C-W>+ <C-W>+
  nnoremap <C-W>- <C-W>-
  nnoremap <C-W>_ <C-W>_
  nnoremap <C-W>< <C-W><
  nnoremap <C-W>> <C-W>>
  nnoremap <C-W><Bar> <C-W><Bar>
  nnoremap <C-W>= <C-W>=
  xnoremap <C-W>+ <C-W>+
  xnoremap <C-W>- <C-W>-
  xnoremap <C-W>_ <C-W>_
  xnoremap <C-W>< <C-W><
  xnoremap <C-W>> <C-W>>
  xnoremap <C-W><Bar> <C-W><Bar>
  xnoremap <C-W>= <C-W>=
  " 1}}} windowModify "
  " windowNew {{{1 "
  nnoremap <C-W>n <C-W>n
  xnoremap <C-W>n <C-W>n
  nnoremap <C-W>^ <C-W>^
  nnoremap <C-W>s <C-W>s
  nnoremap <C-W>v <C-W>v
  xnoremap <C-W>w <C-W>^
  xnoremap <C-W>s <C-W>s
  xnoremap <C-W>v <C-W>v
  " 1}}} windowNew "
  " tabnew {{{1 "
  nnoremap <C-W>T <C-W>T
  xnoremap <C-W>T <C-W>T
  nnoremap <C-W>gf <C-W>gf
  xnoremap <C-W>gf <C-W>gf
  nnoremap <C-W>gF <C-W>gF
  xnoremap <C-W>gF <C-W>gF
  " 1}}} tabnew "
  " windowOpen {{{1 "
  nnoremap <C-W>[ <C-W>}
  nnoremap <C-W>] <C-W>]
  nnoremap <C-W>p <C-W>p
  nnoremap <C-W>P <C-W>P
  nnoremap <C-W>z <C-W>z
  xnoremap <C-W>[ <C-W>}
  xnoremap <C-W>] <C-W>]
  xnoremap <C-W>p <C-W>p
  xnoremap <C-W>P <C-W>P
  xnoremap <C-W>z <C-W>z
  nnoremap <C-W>g} <C-W>g}
  nnoremap <C-W>g] <C-W>g]
  nnoremap <C-W>g<C-]> <C-W>g<C-]>
  nnoremap <C-W>g} <C-W>g}
  xnoremap <C-W>g] <C-W>g]
  xnoremap <C-W>g<C-]> <C-W>g<C-]>
  xnoremap <C-W>g} <C-W>g}
  nnoremap <C-W>i <C-W>i
  xnoremap <C-W>i <C-W>i
  nnoremap <C-W>f <C-W>f
  xnoremap <C-W>f <C-W>f
  nnoremap <C-W>F <C-W>F
  xnoremap <C-W>F <C-W>F
  " 1}}} windowOpen "
  " windowClose {{{1 "
  nnoremap <C-W>c <C-W>c
  nnoremap <C-W>o <C-W>o
  nnoremap <C-W>q <C-W>q
  xnoremap <C-W>c <C-W>c
  xnoremap <C-W>o <C-W>o
  xnoremap <C-W>q <C-W>q
  nnoremap ZZ ZZ
  xnoremap ZZ ZZ
  nnoremap ZQ ZQ
  xnoremap ZQ ZQ
  " 1}}} windowClose "
  " fold+- {{{1 "
  nnoremap zd zd
  nnoremap zD zD
  nnoremap zE zE
  xnoremap zd zd
  xnoremap zD zD
  xnoremap zE zE
  " 1}}} fold+- "
  " spell {{{1 "
  nnoremap z= z=
  nnoremap zg zg
  nnoremap zG zG
  nnoremap zw zw
  nnoremap zW zW
  nnoremap zug zug
  nnoremap zuG zuG
  nnoremap zuw zuw
  nnoremap zuW zuW
  " 1}}} spell "
  " fileSwitch {{{1 "
  nnoremap gf gf
  nnoremap gF gF
  nnoremap g] g]
  xnoremap gf gf
  xnoremap gF gF
  xnoremap g] g]
  " 1}}} fileSwitch "
  " last {{{1 "
  nnoremap g& g&
  xnoremap g& g&
  nnoremap gv gv
  xnoremap gv gv
  nnoremap gi gi
  xnoremap gi gi
  " 1}}} last "
  " show {{{1 "
  nnoremap ga ga
  nnoremap g8 g8
  nnoremap g< g<
  xnoremap g< g<
  " 1}}} show "
  " edit {{{1 "
  xnoremap g<C-A> g<C-A>
  xnoremap g<C-X> g<C-X>
  nnoremap gJ gJ
  nnoremap gp gp
  nnoremap gP gP
  xnoremap gJ gJ
  xnoremap gp gp
  xnoremap gP gP
  nnoremap gu gu
  nnoremap gU gU
  nnoremap g? g?
  xnoremap g? g?
  nnoremap g@ g@
  xnoremap g@ g@
  nnoremap g~ g~
  xnoremap g~ g~
  " 1}}} edit "
endfunction

function! init#which_key#post_source() abort
  let g:which_key_map_leader = {
        \ 'name': '+global map',
        \ }
  call which_key#register('<Space>', 'g:which_key_map_leader')
  call which_key#register(g:maplocalleader, (exists('b:which_key_map_localleader')?'b':'g').':which_key_map_localleader')
  let g:which_key_map_z = {
        \ 'name': '+fold&wrap&spell',
        \ 'u':{
        \ 'name': '+spell',
        \ },
        \ }
  call which_key#register('z', 'g:which_key_map_z')
  let g:which_key_map_Z = {
        \ 'name': '+quit',
        \ }
  call which_key#register('Z', 'g:which_key_map_Z')
  let g:which_key_map_g = {
        \ 'name': '+go&get',
        \ }
  call which_key#register('g', 'g:which_key_map_g')
  let g:which_key_map_C_w = {
        \ 'name': '+window',
        \ 'g':{
        \ 'name': '+go',
        \ },
        \ }
  call which_key#register('<C-W>', 'g:which_key_map_C_w')
  let g:which_key_map_i = {
        \ 'name': '+inner text object',
        \ 'T':{
        \ 'name': '+vim-textobj-datetime',
        \ },
        \ 'j':{
        \ 'name': '+vim-textobj-jabraces',
        \ },
        \ }
  call which_key#register('i', 'g:which_key_map_i')
  let g:which_key_map_a = {
        \ 'name': '+around text object',
        \ 'T':{
        \ 'name': '+vim-textobj-datetime',
        \ },
        \ 'j':{
        \ 'name': '+vim-textobj-jabraces',
        \ },
        \ }
  call which_key#register('a', 'g:which_key_map_a')
  let g:which_key_map_I = {
        \ 'name': '+Inner text object',
        \ }
  call which_key#register('I', 'g:which_key_map_I')
  let g:which_key_map_A = {
        \ 'name': '+Around text object',
        \ }
  call which_key#register('A', 'g:which_key_map_A')
  call which_key#register('.', 'g:which_key_map_startify_dot')
  call which_key#register('c', 'g:which_key_map_fugitive_c')
  call which_key#register('d', 'g:which_key_map_fugitive_d')
  call which_key#register('r', 'g:which_key_map_fugitive_r')
endfunction

augroup init#which_key
  autocmd!
  autocmd BufEnter * call which_key#register(g:maplocalleader,
        \ (exists('b:which_key_map_localleader')? 'b': 'g')
        \ . ':which_key_map_localleader')
  " avoid affect other plugins' hasmapto()
  autocmd VimEnter * call s:which_key()
augroup END
" ex: foldmethod=marker
