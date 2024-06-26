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

if [[ -f ~/.local/share/zinit/plugins/zsh-colorize-functions/colorize-functions.plugin.zsh ]]; then
	. ~/.local/share/zinit/plugins/zsh-colorize-functions/colorize-functions.plugin.zsh
fi

if [[ -f /usr/share/bash-prompt/prompt.sh ]]; then
	. /usr/share/bash-prompt/prompt.sh
	PS1=$(prompt_get_ps1)
elif [[ -f /run/current-system/sw/share/bash-prompt/prompt.sh ]]; then
	. /run/current-system/sw/share/bash-prompt/prompt.sh
	PS1=$(prompt_get_ps1)
else
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

if has_cmd curl &&
	[[ -f /usr/share/code-stats-bash/codestats.sh ]]; then
	. ~/.local/share/zinit/plugins/.pass/pass.sh
	. /usr/share/code-stats-bash/codestats.sh
fi

if has_cmd tmux &&
	[[ $OSTYPE == linux-gnu && -z $TMUX$SSH_TTY$HOMEBREW_DEBUG_INSTALL ]]; then
	if [[ $KITTY_WINDOW_ID == 1 || $WEZTERM_PANE == 0 ]]; then
		exec tmux new -As0
	elif [[ $TERM == linux ]]; then
		tmux new -As0
	fi
fi
