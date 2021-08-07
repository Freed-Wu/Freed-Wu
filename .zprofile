# paths must be loaded here
if [[ ($XDG_SESSION_DESKTOP == deepin || $WAYLAND_DISPLAY || -z $DISPLAY) && -f ~/.xprofile ]]; then
	. ~/.xprofile
fi
if [[ -d /usr/share/texmf-dist/scripts/texlive ]]; then
	export PATH=/usr/share/texmf-dist/scripts/texlive:$PATH
fi
# adb shell doesn't have $LANG
if [[ -z $LANG ]]; then
	export LANG=en_US.UTF-8
fi
if [[ $OSTYPE == linux-android ]]; then
	export PATH=$PATH:$HOME/bin:/system/bin:/system/xbin:/vendor/bin/product/bin:/sbin
fi
# since now vivid doesn't be transplanted to android
if [[ -n $commands[vivid] ]]; then
	export LS_COLORS=$(vivid generate molokai)
fi
# see <https://github.com/termux/termux-packages/issues/4781>
if [[ $OSTYPE == linux-android ]]; then
	export MANPAGER=batman
else
	export MANPAGER="sh -c 'col -bx|bat -plman'"
fi
# tty
if [[ -n $DISPLAY || -n $WAYLAND_DISPLAY ]]; then
	export BROWSER=xdg-open
else
	export BROWSER=w3m
fi
# windows's softwares are outdated
if [[ $OSTYPE != cygwin && $OSTYPE != msys2 ]]; then
	export FZF_DEFAULT_COMMAND='rg --files'
	export FZF_DEFAULT_OPTS='-m
	-d$"\0"
	--preview="less {+1}"
	--bind=tab:down
	--bind=btab:up
	--bind=ctrl-j:jump
	--bind=ctrl-k:kill-line
	--bind=ctrl-q:clear-query
	--bind=alt-a:first
	--bind=alt-e:last
	--bind=alt-N:toggle-in
	--bind=alt-P:toggle-out
	--bind=ctrl-space:toggle
	--bind=ctrl-o:toggle-all
	--bind=ctrl-g:deselect-all
	--bind=alt-g:select-all
	--bind=ctrl-s:toggle-search
	--bind=ctrl-\\:toggle-sort
	--bind=ctrl-^:toggle-preview-wrap
	--bind=esc:toggle-preview
	--bind=alt-p:preview-up
	--bind=alt-n:preview-down
	--bind=ctrl-v:preview-page-down
	--bind=alt-v:preview-page-up
	--bind=ctrl-r:preview-half-page-down
	--bind=alt-r:preview-half-page-up
	--bind=alt-\<:preview-top
	--bind=alt-\>:preview-bottom'
	export FZF_TMUX_HEIGHT=$(($LINES/2))
fi
export LESS='-R -M -S --mouse'
export LESSOPEN='|~/.lessfilter %s'
# user customize
if [[ -f ~/.bash_login ]]; then
	. ~/.bash_login
fi
