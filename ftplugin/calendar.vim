augroup init_calendar
  autocmd!
  autocmd VimResized <buffer> call b:calendar.action('redraw')
augroup END

nunmap <buffer> <C-J>
nunmap <buffer> <C-K>
nunmap <buffer> <C-H>
nunmap <buffer> <C-L>
nunmap <buffer> <Space>
nunmap <buffer> q
nunmap <buffer> Q
nunmap <buffer> t
nunmap <buffer> T
nunmap <buffer> E
nunmap <buffer> y
nmap <buffer> R <Plug>(calendar_redraw)
nmap <buffer> H <Plug>(calendar_view_left)
nmap <buffer> L <Plug>(calendar_view_right)
nmap <buffer> K <Plug>(calendar_up_large)
nmap <buffer> J <Plug>(calendar_down_large)
nmap <buffer> ZZ <Plug>(calendar_hide)
nmap <buffer> ZQ <Plug>(calendar_exit)
nmap <buffer> <C-X> <Plug>(calendar_clear)
nmap <buffer><nowait> = <Plug>(calendar_today)
nmap <buffer> p <Plug>(calendar_event)
nmap <buffer> P <Plug>(calendar_task)
nmap <buffer> x <Plug>(calendar_delete_line)
nmap <buffer> c <Plug>(calendar_change_line)
nmap <buffer> u <Plug>(calendar_undo_line)
