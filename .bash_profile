# shellcheck shell=bash
# /etc/skel/.bash_profile
if [ -f ~/.xprofile ]; then
  # https://github.com/koalaman/shellcheck/issues/1845
  . "$HOME/.xprofile"
fi
if [ -f ~/.bash_login ]; then
  . "$HOME/.bash_login"
fi
