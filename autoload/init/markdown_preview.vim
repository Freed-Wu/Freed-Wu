function! init#markdown_preview#source() abort
  " if network cannot be accessed
  " g:mkdp_open_to_the_world = 1 stop markdown-preview working
  let g:mkdp_port = '8000'
  let g:mkdp_browser = 'xdg-open'
  let g:mkdp_page_title = '${name}'
  let g:mkdp_filetypes = ['markdown', 'pandoc']
endfunction
