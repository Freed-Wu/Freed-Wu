#!/usr/bin/env bash
#shellcheck disable=SC2046
set -e
cd "$(dirname "$(readlink -f "$0")")/.."
# `. "$HOME/.nix-profile/etc/profile.d/nix.sh"` cannot work
export PATH=~/.nix-profile/bin:$PATH
git config --global safe.directory '*'
git reset --hard
# \n\r to skip docker build timestamp
echo -e "\n\r::group::Install zsh plugins"
[ -f ~/.local/share/zinit/plugins/zinit/zinit.zsh ] ||
	git clone --depth=1 https://github.com/zdharma-continuum/zinit \
		~/.local/share/zinit/plugins/zinit
TERM=xterm-256color TMUX='' zsh -isc '@zinit-scheduler burst'
echo -e "\n\r::endgroup::"
echo -e "\n\r::group::Install tmux plugins"
[ -f ~/.config/tmux/plugins/tpm/bin/install_plugins ] ||
	git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
~/.config/tmux/plugins/tpm/bin/install_plugins
echo -e "\n\r::endgroup::"
echo -e "\n\r::group::Install vim plugins"
# git clone is needed
[ -f ~/.local/share/nvim/repos/github.com/Shougo/dein.vim/autoload/dein.vim ] ||
	git clone --depth=1 https://github.com/Shougo/dein.vim ~/.local/share/nvim/repos/github.com/Shougo/dein.vim
vi --headless -c'call dein#update() | quit'
# https://github.com/neoclide/coc.nvim/discussions/4960#discussioncomment-8925992
# 2>&1 is needed
npm install --ignore-scripts --no-lockfile --omit=dev --legacy-peer-deps --no-global \
	-C ~/.config/coc/extensions $(script/install_plugins.vim 2>&1)
echo -e "\n\r::endgroup::"
echo -e "\n\r::group::Install python packages"
sudo install -D ~/.config/pip/pip.conf -t /root/.config/pip
# avoid OSError: 'git' was not found
sudo PATH="$HOME/.nix-profile/bin:$PATH" script/requirements.txt
echo -e "\n\r::endgroup::"
# ex: foldmethod=marker foldmarker=\:\:group\:\:,\:\:endgroup\:\:
