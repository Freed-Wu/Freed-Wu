#!/usr/bin/env zsh
echo "export LS_COLORS='$(vivid generate molokai)'" > vivid.sh
zcompile *.sh
