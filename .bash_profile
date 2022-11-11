# shellcheck shell=bash source=/dev/null
# https://github.com/koalaman/shellcheck/issues/1845
# /etc/skel/.bash_profile
if [ -f ~/.xprofile ]; then
	. ~/.xprofile
fi
if [ -f ~/.bash_login ]; then
	. ~/.bash_login
fi
