function! init#textobj#datetime#source() abort
  let g:textobj_datetime_no_default_key_mappings = 1
  call textobj#user#map('datetime', {
        \ 'auto': {'select': 'iT'},
        \ 'full': {'select': 'aT'},
        \ 'date': {'select': 'iY'},
        \ 'time': {'select': 'aY'},
        \ 'tz': {'select': 'iZ'},
        \ })
endfunction
