if [[ $SHELL == '/system/bin/sh' ]]; then
	export PREFIX=/data/data/com.termux/files/usr
	export PATH=$PREFIX/bin:$PATH
	export HOME=/data/data/com.termux/files/home
	cd
	. ~/.zprofile
	exec $PREFIX/bin/zsh
fi
