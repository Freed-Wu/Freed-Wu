setlocal nonumber
setlocal norelativenumber

nnoremap <silent><buffer> <LeftMouse> :<C-U>call init#init#fern#leftmouse()<CR>
nnoremap <silent><buffer> <2-LeftMouse> :<C-U>call init#init#fern#2leftmouse()<CR>
nnoremap <silent><buffer> <C-LeftMouse> :<C-U>call init#init#fern#cleftmouse()<CR>
nnoremap <silent><buffer> <MiddleMouse> :<C-U>call init#init#fern#middlemouse()<CR>
nnoremap <silent><buffer> <RightMouse> :<C-U>call init#init#fern#rightmouse()<CR>

nmap <buffer> g? <Plug>(fern-action-help)
nmap <buffer> g: <Plug>(fern-action-choice)
nmap <buffer> zM <Plug>(fern-action-zoom:full)
nmap <buffer> zm <Plug>(fern-action-zoom:half)
nmap <buffer> zr <Plug>(fern-action-zoom:reset)
nmap <buffer> zR <Plug>(fern-action-zoom)
nmap <buffer> <nowait> _ <Plug>(fern-action-hidden)
nmap <buffer> <nowait> = <Plug>(fern-action-include)
nmap <buffer> <nowait> + <Plug>(fern-action-exclude)
nmap <buffer> <nowait> - <Plug>(fern-action-reveal)
nmap <buffer> gq <Plug>(fern-action-mark:clear)
nmap <buffer> s <Plug>(fern-action-mark)
nmap <buffer> S <Plug>(fern-action-mark:set)
nmap <buffer> <C-S> <Plug>(fern-action-mark:unset)
nmap <buffer> J <Plug>(fern-action-mark)j
nmap <buffer> K k<Plug>(fern-action-mark)
nmap <buffer> gJ j<Plug>(fern-action-mark)
nmap <buffer> gK <Plug>(fern-action-mark)k
nmap <buffer> gR <Plug>(fern-action-reload:cursor)
nmap <buffer> R <Plug>(fern-action-reload)
nmap <buffer> P <Plug>(fern-action-focus:parent)
nmap <buffer> gu <Plug>(fern-action-leave)

nmap <buffer> <Plug>(fern-action-expand) <Plug>(fern-action-expand:stay)
nmap <buffer> <expr> o fern#smart#leaf(
      \ '<Plug>(fern-action-open)',
      \ '<Plug>(fern-action-expand)',
      \ '<Plug>(fern-action-collapse)'
      \ )
nmap <buffer> <expr> i fern#smart#leaf(
      \ '<Plug>(fern-action-open:select)',
      \ '<Plug>(fern-action-enter)'
      \ )
nmap <buffer> <expr> I fern#smart#leaf(
      \ '<Plug>(fern-action-open:split)',
      \ '<Plug>(fern-action-enter)'
      \ )
nmap <buffer> <expr> O fern#smart#leaf(
      \ '<Plug>(fern-action-open:vsplit)',
      \ '<Plug>(fern-action-expand)',
      \ '<Plug>(fern-action-collapse)'
      \ )
nmap <buffer> <expr> P fern#smart#leaf(
      \ '<Plug>(fern-action-open:tabedit)',
      \ '<Plug>(fern-action-expand)',
      \ '<Plug>(fern-action-collapse)'
      \ )
nmap <buffer> go <Plug>(fern-action-diff)
nmap <buffer> gi <Plug>(fern-action-diff:select)
nmap <buffer> gO <Plug>(fern-action-diff:split)
nmap <buffer> gI <Plug>(fern-action-diff:vsplit)
nmap <buffer> gP <Plug>(fern-action-diff:tabedit)
nmap <buffer> ysp <Plug>(fern-action-yank:badge)
nmap <buffer> yip <Plug>(fern-action-yank:label)
nmap <buffer> yap <Plug>(fern-action-yank)
nmap <buffer> ! <Plug>(fern-action-ex)
nmap <buffer> a <Plug>(fern-action-new-path)
nmap <buffer> A <Plug>(fern-action-new-dir)
nmap <buffer> gA <Plug>(fern-action-new-leaf)
nmap <buffer> X <Plug>(fern-action-trash)
nmap <buffer> <C-X> <Plug>(fern-action-remove)
nmap <buffer> r <Plug>(fern-action-move)
nmap <buffer> gr <Plug>(fern-action-rename)
nmap <buffer> gc <Plug>(fern-action-copy)
nmap <buffer> c <Plug>(fern-action-clipboard-copy)
nmap <buffer> x <Plug>(fern-action-clipboard-move)
nmap <buffer> p <Plug>(fern-action-clipboard-paste)
nmap <buffer> Q <Plug>(fern-action-clipboard-clear)
nmap <buffer> gx <Plug>(fern-action-open:system)
nmap <buffer> gX <Plug>(fern-action-terminal)
nmap <buffer> C <Plug>(fern-action-cd:root)

nmap <buffer> gU <Plug>(fern-action-project-top)
nmap <buffer> ~ <Plug>(fern-action-project-top:reveal)

nmap <buffer> yss <Plug>(fern-action-mark-children:set)
nmap <buffer> dss <Plug>(fern-action-mark-children:unset)
nmap <buffer> css <Plug>(fern-action-mark-children:toggle)
nmap <buffer> ys. <Plug>(fern-action-mark-children:set:leaf)
nmap <buffer> ds. <Plug>(fern-action-mark-children:unset:leaf)
nmap <buffer> cs. <Plug>(fern-action-mark-children:toggle:leaf)
nmap <buffer> ys/ <Plug>(fern-action-mark-children:set:branch)
nmap <buffer> ds/ <Plug>(fern-action-mark-children:unset:branch)
nmap <buffer> cs/ <Plug>(fern-action-mark-children:toggle:branch)

nmap <buffer> <C-N> <Plug>(fern-action-quickfix)
nmap <buffer> <C-A> <Plug>(fern-action-quickfix:add)
nmap <buffer> <C-R> <Plug>(fern-action-quickfix:replace)
nmap <buffer> g<C-N> <Plug>(fern-action-loclist)
nmap <buffer> g<C-A> <Plug>(fern-action-loclist:add)
nmap <buffer> g<C-R> <Plug>(fern-action-loclist:replace)

nmap <buffer> yop <Plug>(fern-action-preview:auto:toggle)
nmap <buffer> <M-p> <Plug>(fern-action-preview:scroll:up:half)
nmap <buffer> <M-n> <Plug>(fern-action-preview:scroll:down:half)

nmap <buffer> <nowait> <lt> <Plug>(fern-action-git-stage)
nmap <buffer> <nowait> > <Plug>(fern-action-git-unstage)
