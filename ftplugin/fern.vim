setlocal nonumber
setlocal norelativenumber

nmap <buffer> g? <Plug>(fern-action-help)
nmap <buffer> g: <Plug>(fern-action-choice)
nmap <buffer> <C-W>i <Plug>(fern-action-zoom)
nmap <silent><buffer> <C-W>d <Plug>(fern-action-zoom:reset)
nmap <buffer><nowait> _ <Plug>(fern-action-hidden)
nmap <buffer><nowait> = <Plug>(fern-action-include)
nmap <buffer><nowait> + <Plug>(fern-action-exclude)
nmap <buffer><nowait> - <Plug>(fern-action-reveal)
nmap <silent><buffer> gq <Plug>(fern-action-mark:clear)
nmap <silent><buffer> s <Plug>(fern-action-mark:set)
nmap <silent><buffer> S <Plug>(fern-action-mark:unset)
nmap <buffer> J <Plug>(fern-action-mark)j
nmap <buffer> K k<Plug>(fern-action-mark)
nmap <buffer> gJ j<Plug>(fern-action-mark)
nmap <buffer> gK <Plug>(fern-action-mark)k
nmap <silent><buffer> gR <Plug>(fern-action-reload:cursor)
nmap <buffer> R <Plug>(fern-action-reload)
nmap <silent><buffer> P <Plug>(fern-action-focus:parent)
nmap <buffer> gu <Plug>(fern-action-leave)

nmap <silent><buffer> <Plug>(fern-action-expand) <Plug>(fern-action-expand:stay)
nmap <buffer><expr> o fern#smart#leaf(
      \ '<Plug>(fern-action-open)',
      \ '<Plug>(fern-action-expand)',
      \ '<Plug>(fern-action-collapse)'
      \ )
nmap <buffer><expr> i fern#smart#leaf(
      \ '<Plug>(fern-action-open:select)',
      \ '<Plug>(fern-action-enter)'
      \ )
nmap <buffer><expr> I fern#smart#leaf(
      \ '<Plug>(fern-action-open:split)',
      \ '<Plug>(fern-action-enter)'
      \ )
nmap <buffer><expr> O fern#smart#leaf(
      \ '<Plug>(fern-action-open:vsplit)',
      \ '<Plug>(fern-action-expand)',
      \ '<Plug>(fern-action-collapse)'
      \ )
nmap <buffer><expr> P fern#smart#leaf(
      \ '<Plug>(fern-action-open:tabedit)',
      \ '<Plug>(fern-action-expand)',
      \ '<Plug>(fern-action-collapse)'
      \ )
nmap <buffer> go <Plug>(fern-action-diff)
nmap <silent><buffer> gi <Plug>(fern-action-diff:select)
nmap <silent><buffer> gO <Plug>(fern-action-diff:split)
nmap <silent><buffer> gI <Plug>(fern-action-diff:vsplit)
nmap <silent><buffer> gP <Plug>(fern-action-diff:tabedit)
nmap <silent><buffer> ysp <Plug>(fern-action-yank:badge)
nmap <silent><buffer> yip <Plug>(fern-action-yank:label)
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
nmap <silent><buffer> gx <Plug>(fern-action-open:system)
nmap <buffer> gX <Plug>(fern-action-terminal)
nmap <silent><buffer> C <Plug>(fern-action-cd:root)

nmap <buffer> gU <Plug>(fern-action-project-top)
nmap <silent><buffer> ~ <Plug>(fern-action-project-top:reveal)

nmap <silent><buffer> yss <Plug>(fern-action-mark-children:set)
nmap <silent><buffer> dss <Plug>(fern-action-mark-children:unset)
nmap <silent><buffer> css <Plug>(fern-action-mark-children:toggle)
nmap <silent><buffer> ys. <Plug>(fern-action-mark-children:set:leaf)
nmap <silent><buffer> ds. <Plug>(fern-action-mark-children:unset:leaf)
nmap <silent><buffer> cs. <Plug>(fern-action-mark-children:toggle:leaf)
nmap <silent><buffer> ys/ <Plug>(fern-action-mark-children:set:branch)
nmap <silent><buffer> ds/ <Plug>(fern-action-mark-children:unset:branch)
nmap <silent><buffer> cs/ <Plug>(fern-action-mark-children:toggle:branch)

nmap <buffer> <C-N> <Plug>(fern-action-quickfix)
nmap <silent><buffer> <C-A> <Plug>(fern-action-quickfix:add)
nmap <silent><buffer> <C-R> <Plug>(fern-action-quickfix:replace)
nmap <buffer> g<C-N> <Plug>(fern-action-loclist)
nmap <silent><buffer> g<C-A> <Plug>(fern-action-loclist:add)
nmap <silent><buffer> g<C-R> <Plug>(fern-action-loclist:replace)

nmap <buffer> gs <Plug>(fern-action-save-as-bookmark)

nmap <silent><buffer> yop <Plug>(fern-action-preview:auto:toggle)
nmap <silent><buffer> <M-p> <Plug>(fern-action-preview:scroll:up:half)
nmap <silent><buffer> <M-n> <Plug>(fern-action-preview:scroll:down:half)

nmap <buffer><nowait> <lt> <Plug>(fern-action-git-stage)
nmap <buffer><nowait> > <Plug>(fern-action-git-unstage)
