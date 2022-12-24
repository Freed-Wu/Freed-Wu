# shellcheck disable=all
# Add some programs to $PATH before other commands
if [[ -f ~/.nix-profile/etc/profile.d/nix.sh ]]; then
  . ~/.nix-profile/etc/profile.d/nix.sh
fi
# for tty
if [[ -f ~/.xprofile ]] && ((! $+PYTHONSTARTUP)); then
  . ~/.xprofile
fi
if [[ -f ~/.bash_profile ]] && ((! $+DOCKER_BUILDKIT)); then
  . ~/.bash_profile
fi
