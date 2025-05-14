nunmap <buffer> <Space>
nnoremap <buffer> h h
nnoremap <buffer> <Esc> <Esc>
nnoremap <buffer> q q
nmap <buffer> t <Plug>Sneak_t
nmap <buffer> f <Plug>Sneak_f
nmap <buffer> F <Plug>Sneak_F
nnoremap <silent><buffer> <F1> :<C-U>call b:toc.toggle_help()<CR>
nnoremap <silent><buffer> ZQ :<C-U>call b:toc.close()<CR>
nnoremap <silent><buffer> p :<C-U>call b:toc.activate_current(0)<CR>
nnoremap <silent><buffer> S :<C-U>call b:toc.toggle_sorted_todos()<CR>
nnoremap <silent><buffer> <C-X> :<C-U>call b:toc.clear_filter()<CR>
nnoremap <silent><buffer> <C-A> :<C-U>call b:toc.filter()<CR>
nnoremap <silent><buffer> K :<C-U>call b:toc.increase_depth()<CR>
nnoremap <silent><buffer> J :<C-U>call b:toc.decrease_depth()<CR>
