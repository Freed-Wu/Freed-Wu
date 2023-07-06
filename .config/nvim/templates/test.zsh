# shellcheck disable=all
# $ uname -r
# {{ trim(system('uname -r')) }}
# $ zsh --version
# {{ trim(system('zsh --version')) }}
# $ cat test.zsh
. ~/.local/share/zinit/plugins/{% here %}/*.plugin.zsh
# $ zsh -df
# $ . ./test.zsh
