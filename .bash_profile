# /etc/skel/.bash_profile
if [[ -f ~/.xprofile ]] ; then
	source ~/.xprofile
fi
if [[ -f ~/.bash_login ]]; then
	source ~/.bash_login
fi
# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	source ~/.bashrc
fi
