#!/usr/bin/env zsh
() {
  local src="$(direnv hook zsh)"
  src="${src/\/nix\/store\/*\///run/current-system/sw/}"
  echo "$src" > direnv.sh
  zcompile *.sh
}
