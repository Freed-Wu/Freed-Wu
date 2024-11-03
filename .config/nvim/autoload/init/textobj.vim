""
" assets/json/textobj
function! init#textobj#map(map_name, ...) abort
  let l:json_name = get(a:000, 0, a:map_name)
  let l:map = init#get_json('assets/json/textobj/' . l:json_name . '.json')
  call textobj#user#map(a:map_name, l:map)
endfunction
