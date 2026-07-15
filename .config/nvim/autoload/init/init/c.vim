function! init#init#c#nix() abort
  if !exists('s:nix_include')
    let s:nix_include = eval(trim(system(expand('~/.config/nvim/scripts/get-c_path.nix'))))
  endif
  return s:nix_include
endfunction

function! init#init#c#main() abort
  setlocal path=.,,/usr/include,~/.local/include,~/.local/state/nix/profile/include
  if filereadable('/run/current-system/nixos-version')
    setlocal path-=/usr/include
    let &l:path .= ',' . init#init#c#nix()
  else
    setlocal path+=/usr/local/include,/usr/src/linux/include,/usr/src/linux/arch/*/include
  endif
endfunction
