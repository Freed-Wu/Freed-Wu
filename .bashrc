# /etc/skel/.bashrc
#
# This file is .d by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi
shopt -s histverify
shopt -s globstar
shopt -s checkhash
shopt -s mailwarn

if [[ -f /usr/share/fzf-tab-completion/bash/fzf-bash-completion.sh ]] ; then
	. /usr/share/fzf-tab-completion/bash/fzf-bash-completion.sh
	bind -x '"\t": fzf_bash_completion'
fi

if [[ -f /usr/share/pinyin-completion/shell/pinyin-comp.bash ]] ; then
	. /usr/share/pinyin-completion/shell/pinyin-comp.bash
fi

# Put your fun stuff here.
HISTIGNORE='&: *'
PS1='\[\e[37;44m\d\t\e[34;41m\e[30m\s\e[31;42m\e[30m\u\e[32;43m\e[30m\h\e[33;45m\e[30m\w\e[35;40m\e[37m\]\n\#\$ '
PS2='❯❯ '
PS3='? '
