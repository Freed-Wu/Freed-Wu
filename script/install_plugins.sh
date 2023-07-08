#!/usr/bin/env bash
cd "$(dirname "$(readlink -f "$0")")/.." || exit 1
# `. "$HOME/.nix-profile/etc/profile.d/nix.sh"` cannot work
export PATH=~/.nix-profile/bin:$PATH
git config --global safe.directory '*'
git reset --hard
# \n\r to skip docker build timestamp
echo -e "\n\r::group::Install zsh plugins"
[ -f ~/.local/share/zinit/plugins/zinit/zinit.zsh ] ||
	git clone --depth=1 https://github.com/zdharma-continuum/zinit \
		~/.local/share/zinit/plugins/zinit &&
	TERM=xterm-256color TMUX='' zsh -isc '@zinit-scheduler burst'
echo -e "\n\r::endgroup::"
echo -e "\n\r::group::Install tmux plugins"
[ -f ~/.config/tmux/plugins/tpm/bin/install_plugins ] ||
	git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm &&
	~/.config/tmux/plugins/tpm/bin/install_plugins
echo -e "\n\r::endgroup::"
echo -e "\n\r::group::Install vim plugins"
# git clone is needed
[ -f ~/.local/share/nvim/repos/github.com/Shougo/dein.vim/autoload/dein.vim ] ||
	git clone --depth=1 https://github.com/Shougo/dein.vim ~/.local/share/nvim/repos/github.com/Shougo/dein.vim &&
	script/install_plugins.vim
echo -e "\n\r::endgroup::"
echo -e "\n\r::group::Install python packages"
sudo install -D ~/.config/pip/pip.conf -t /root/.config/pip
# avoid OSError: 'git' was not found
sudo PATH="$HOME/.nix-profile/bin:$PATH" script/requirements.txt
echo -e "\n\r::endgroup::"
# ex: foldmethod=marker foldmarker=\:\:group\:\:,\:\:endgroup\:\: