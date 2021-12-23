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

if [[ -f /usr/share/fzf-tab-completion/bash/fzf-bash-completion.sh ]]; then
  . /usr/share/fzf-tab-completion/bash/fzf-bash-completion.sh
  bind -x '"\t": fzf_bash_completion'
fi

if [[ -f ~/.zinit/plugins/pinyin-completion/shell/pinyin-comp.bash ]]; then
  . "$HOME/.zinit/plugins/pinyin-completion/shell/pinyin-comp.bash"
fi

if [[ -f ~/.local/share/bash/bash-wakatime/bash-wakatime.sh && $(command -v wakatime) ]]; then
  . "$HOME/.local/share/bash/bash-wakatime/bash-wakatime.sh"
fi

if [[ $OSTYPE == linux-gnu && -z $TMUX && $(command -v tmux) ]]; then
  exec tmux new -As0
fi

# Put your fun stuff here.
HISTIGNORE='&: *'
PS1='\[\e[37;44m\d\t\e[34;41m\e[30m\s\e[31;42m\e[30m\u\e[32;43m\e[30m\h\e[33;45m\e[30m\w\e[35;40m\e[37m\]\n '
PS2='--> '
PS3='? '

stty -ixon

if [[ $(command -v nvim.qv2ray) ]]; then
  alias vi=nvim.qv2ray
fi

if [[ -n $TMUX && $(tmux -V) == 'tmux 1.8' && -f ~/.config/tmux/plugins/tmux-pain-control/pain_control.tmux ]]; then
  ~/.config/tmux/plugins/tmux-pain-control/pain_control.tmux 2>/dev/null
  export TERM=screen-256color
fi
