let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
let s:json_dir = s:path . '/assets/json'

function! init#get_json(json_name) abort
  let l:json_path = s:json_dir . '/' . a:json_name . '.json'
  return json_decode(join(readfile(l:json_path), ''))
endfunction

function! init#parse(dict) abort
  if a:dict[0] == 0
    let l:word = getline('.')[col('v') - 1:col("'>") - 1]
  else
    let l:scope = a:dict[1]
    let l:word = expand('<' . l:scope . '>')
  endif
  return l:word
endfunction
