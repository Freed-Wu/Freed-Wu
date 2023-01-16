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
shopt -s histverify
shopt -s globstar
shopt -s checkhash
shopt -s mailwarn
if [[ $OSTYPE == msys2 || $OSTYPE == cygwin ]]; then
	shopt -s completion_strip_exe
fi
stty -ixon
HISTIGNORE='&: *'

if [[ -f ~/.local/share/zinit/plugins/pinyin-completion/shell/pinyin-comp.bash ]]; then
	. ~/.local/share/zinit/plugins/pinyin-completion/shell/pinyin-comp.bash
fi

if command -v wakatime &>/dev/null &&
	[[ -f /usr/share/bash-wakatime/bash-wakatime.sh ]]; then
	. /usr/share/bash-wakatime/bash-wakatime.sh
fi

if command -v tmux &>/dev/null &&
	[[ $OSTYPE == linux-gnu && -z $TMUX$SSH_TTY$HOMEBREW_DEBUG_INSTALL ]]; then
	if [[ $KITTY_WINDOW_ID == 1 || $WEZTERM_PANE == 0 ]]; then
		exec tmux new -As0
	elif [[ $TERM == linux ]]; then
		tmux new -As0
	fi
fi

declare -A platforms=(
	[android]=
	[arch]=
	[centos]=
	[debian]=
	[docker]=
	[gentoo]=
	[linux]=
	[macos]=
	[ubuntu]=
	[windows]=
)
if [[ $(ps -p1 -ocmd=) == /sbin/docker-init ]]; then
	platform=docker
elif [[ $PREFIX == /data/data/com.termux/files/usr ]]; then
	platform=android
elif [[ $OSTYPE == darwin ]]; then
	platform=macos
elif [[ $OSTYPE == msys2 || $OSTYPE == cygwin ]]; then
	platform=windows
elif [[ $OSTYPE == linux-gnu ]]; then
	platform=linux
fi
if command -v lsb_release &>/dev/null; then
	lsb=$(lsb_release -i | cut -f2)
	if [[ $lsb == Arch ]]; then
		platform=arch
	elif [[ $lsb == Centos ]]; then
		platform=centos
	elif [[ $lsb == Debian ]]; then
		platform=debian
	elif [[ $lsb == Ubunut ]]; then
		platform=ubunut
	elif [[ $lsb == Gentoo ]]; then
		platform=gentoo
	fi
fi
declare icon=${platforms[$platform]}
if [ -f /usr/share/zsh-theme-powerlevel10k/gitstatus/gitstatus.prompt.sh ]; then
	. /usr/share/zsh-theme-powerlevel10k/gitstatus/gitstatus.prompt.sh
fi
if [[ -n $SSH_TTY || $USER == root ]]; then
	declare host_info=" \u@\h"
fi
PS1='\[\e[30;47m'" $icon $host_info"'\e[37;43m\e[30m  \s \v \e[33;47m\e[30m  \t \e[37;44m\e[37m  \e[1m\w \e[0;34;40m \e[32m ${GITSTATUS_PROMPT}\e[40m \e[0;30m\e[0m\]\n$ '
