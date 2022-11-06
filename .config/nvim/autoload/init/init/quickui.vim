function! init#init#quickui#install(json_name) abort
  let l:ctx = init#get_json('context/' . a:json_name)
  let l:ctx = map(l:ctx, {_, v -> v + [get(v, 1)]})
  call quickui#context#open(l:ctx, {})
endfunction
