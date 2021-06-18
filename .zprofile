# tmux in android (termux) will source `~/.zprofile` again,
# so we don't source `~/.xprofile` when `[[ -z $TMUX ]]` is false.
if [[ -n $TMUX && $OSTYPE == linux-android ]]; then
	return
fi
if [[ $OSTYPE == linux-android ]]; then
	export PATH=$PATH:/system/bin:/system/xbin:/vendor/bin/product/bin:/sbin
fi
# adb shell don't have $LANG
if [[ -n $LANG ]]; then
	export LANG=en_US.UTF-8
fi
# tty
if [[ -z $DISPLAY ]]; then
	export BROWSER=w3m
fi
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
# user customize
if [[ -f ~/.bash_login ]]; then
	source ~/.bash_login
fi
