function! init#init#quickui#install(json_name) abort
  let l:ctx = init#get_json(a:json_name)
  let l:ctx = init#quickui#process(l:ctx)
  call quickui#context#open(l:ctx, {})
endfunction
