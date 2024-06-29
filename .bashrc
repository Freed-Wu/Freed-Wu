# shellcheck shell=bash source=/dev/null
# /etc/skel/.bashrc
#
# This file is .d by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
	# Shell is non-interactive.  Be done now!
	return
fi

# https://unix.stackexchange.com/questions/32409/set-and-shopt-why-two
set +o histexpand

shopt -s histverify
shopt -s globstar
shopt -s checkhash
shopt -s mailwarn
if [[ $OSTYPE == msys2 || $OSTYPE == cygwin ]]; then
	shopt -s completion_strip_exe
fi
stty -ixon
HISTIGNORE='&: *'

source_file() {
	local prefix file="$1"
	# ble.sh parses $@
	shift
	for prefix in ~/.local/share /usr/share /run/current-system/sw/share; do
		if [[ -f "$prefix/$file" ]]; then
			. "$prefix/$file"
			return
		fi
	done
}

source_file blesh/ble.sh "$@"
source_file zinit/plugins/zsh-colorize-functions/zsh-colorize-functions.plugin.zsh

if [[ ${BLE_VERSION-} ]]; then
	# https://github.com/akinomyoga/ble.sh/discussions/463
	ble-face -s auto_complete fg=8
	ble-face -s syntax_comment fg=63

	bleopt import_path="${XDG_DATA_HOME:-$HOME/.local/share}/blesh/local:${PREFIX:-/usr}/share/blesh/contrib:/run/current-system/sw/share/blesh/contrib:$HOME/.local/state/nix/profile/share/blesh/contrib"
	ble-import -d integration/fzf-completion
	ble-import -d integration/fzf-key-bindings
else
	source_file fzf/completion.bash
	source_file fzf/key-bindings.bash
fi

source_file bash-prompt/prompt.sh
if [[ "$(type -t prompt_get_ps1)" == function ]]; then
	PS1=$(prompt_get_ps1)
fi
if [[ "$(type -t has_cmd)" != function ]]; then
	has_cmd() {
		local opt
		for opt; do
			if command -v "$opt" >/dev/null; then
				continue
			else
				return $?
			fi
		done
	}
fi
if [[ -e "$HOME/.zlogin" ]]; then
	. "$HOME/.zlogin"
fi

source_file zinit/plugins/.pass/pass.sh
if has_cmd curl; then
	source_file code-stats-bash/codestats.sh
fi

if has_cmd tmux &&
	[[ $OSTYPE == linux-gnu && -z $TMUX$SSH_TTY$HOMEBREW_DEBUG_INSTALL ]]; then
	if [[ $KITTY_WINDOW_ID == 1 || $WEZTERM_PANE == 0 ]]; then
		exec tmux new -As0
	elif [[ $TERM == linux ]]; then
		tmux new -As0
	fi
fi
# ex: path=.,,~/.local/share,/usr/share,/run/current-system/sw/share
