# shellcheck disable=all
# Add ~/.local/state/nix/profile/bin to $PATH
if [[ -f ~/.local/state/nix/profile/etc/profile.d/nix.sh ]]; then
	. ~/.local/state/nix/profile/etc/profile.d/nix.sh
fi
if [[ -f ~/.bash_profile ]] && ((! $+DOCKER_BUILDKIT)); then
	. ~/.bash_profile
fi
if [[ -f ~/.local/share/zinit/plugins/.pass/pass.sh ]]; then
	. ~/.local/share/zinit/plugins/.pass/pass.sh
fi
# https://github.com/NixOS/nixpkgs/issues/282076
# https://github.com/3v1n0/zsh-bash-completions-fallback/pull/12
if [[ -d /run/current-system/sw/share ]] &&
	[[ ${XDG_DATA_DIRS#/run/current-system/sw/share:} == $XDG_DATA_DIRS ]]; then
	XDG_DATA_DIRS="/run/current-system/sw/share${XDG_DATA_DIRS+:}$XDG_DATA_DIRS"
fi
if [[ -z $C6X_C_DIR && -f ~/.bash_login ]]; then
	. ~/.bash_login
fi
