# /etc/skel/.bash_profile
if [ -f ~/.xprofile ]; then
	. ~/.xprofile
fi
if [ -f ~/.bash_login ]; then
	. ~/.bash_login
fi
# This file is .d by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
