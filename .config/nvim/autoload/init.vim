let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! init#get_json(json_name) abort
  let l:json_path = s:path . '/' . a:json_name
  return json_decode(join(readfile(l:json_path), ''))
endfunction

function! init#parse(dict) abort
  if a:dict[0] == 0
    let l:word = getline('.')[col('v') - 1:col("'>") - 1]
  elseif a:dict[1] ==# '.'
    let l:word = getline(a:dict[1])
  else
    let l:scope = a:dict[1]
    let l:word = expand('<' . l:scope . '>')
  endif
  return l:word
endfunction
