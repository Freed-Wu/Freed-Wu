#!/usr/bin/env zsh
vim_mode_set_keymap "$(vim-mode-initial-keymap)"
bindkey -Mvisual s add-surround
# restore emacs mode after load this plugin
bindkey -e
