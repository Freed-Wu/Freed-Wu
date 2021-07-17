# paths must be loaded here
if [[ ($XDG_SESSION_DESKTOP == deepin || -z $DISPLAY) && -f ~/.xprofile ]]; then
	source ~/.xprofile
else
	export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
	export PATH=$HOME/Applications:$PATH
	export PATH=$HOME/.local/bin:$PATH
	export PATH=$HOME/.cargo/bin:$PATH
	export PATH=$HOME/.cabal/bin:$PATH
	export PATH=$HOME/go/bin:$PATH
	export PATH=$HOME/perl5/bin:$PATH
	export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH
	export MANPATH=$HOME/.local/share/man:$MANPATH
	export MANPATH=/home/linuxbrew/.linuxbrew/share/man:$MANPATH
	export INFOPATH=/home/linuxbrew/.linuxbrew/share/info:$INFOPATH
fi
# tmux in android (termux) will source `~/.zprofile` again,
# so we don't source `~/.xprofile` when `[[ -z $TMUX ]]` is false.
if [[ -n $TMUX && $OSTYPE == linux-android ]]; then
	return
fi
if [[ $OSTYPE == linux-android ]]; then
	export PATH=$PATH:$HOME/bin:/system/bin:/system/xbin:/vendor/bin/product/bin:/sbin
fi
# adb shell don't have $LANG
if [[ -n $LANG ]]; then
	export LANG=en_US.UTF-8
fi
# since now vivid doesn't be transplanted to android
if [[ $OSTYPE == linux-gnu ]]; then
	export LS_COLORS=`vivid generate molokai`
fi
# see <https://github.com/termux/termux-packages/issues/4781>
if [[ $OSTYPE == linux-android ]]; then
	export MANPAGER=batman
else
	export MANPAGER="sh -c 'col -bx|bat -plman'"
fi
# tty
if [[ -z $DISPLAY ]]; then
	export BROWSER=w3m
else
	export BROWSER=xdg-open
fi
# windows's softwares are outdated
if [[ $OSTYPE != cygwin && $OSTYPE != msys2 ]]; then
	export FZF_DEFAULT_COMMAND='rg --files'
	export FZF_DEFAULT_OPTS='-m
	--preview "less {}"
	--bind=ctrl-k:kill-line
	--bind=ctrl-j:first
	--bind=ctrl-alt-r:toggle-preview
	--bind=ctrl-alt-R:toggle-preview-wrap
	--bind=alt-s:toggle-search
	--bind=alt-S:toggle-sort
	--bind=ctrl-alt-i:toggle
	--bind=ctrl-alt-I:toggle-all
	--bind=alt-p:preview-up
	--bind=alt-n:preview-down
	--bind=ctrl-v:preview-page-down
	--bind=alt-v:preview-page-up
	--bind=ctrl-alt-v:preview-half-page-down
	--bind=alt-V:preview-half-page-up
	--bind=alt-a:preview-top
	--bind=alt-e:preview-bottom'
	export LESSOPEN='|lesspipe %s'
fi
export LESS='-R -M -S --mouse'
# user customize
if [[ -f ~/.bash_login ]]; then
	source ~/.bash_login
fi
