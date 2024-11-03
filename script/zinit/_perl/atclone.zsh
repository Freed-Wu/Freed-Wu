#!/usr/bin/env zsh
"$(dirname "$(readlink -f "$0")")"/atclone.pl ~/.git-credentials > brew.sh
zcompile *.sh
