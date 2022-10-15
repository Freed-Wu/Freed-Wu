# shellcheck disable=all
: << EOF
$ uname -r
.!uname -r%HERE%
$ has
.!has zsh
EOF
# $ cat test.zsh
. ~/.local/share/zinit/plugins//*.plugin.zsh
# $ zsh -df
# $ . ./test.zsh
