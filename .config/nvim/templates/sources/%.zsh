# :fzf-tab:complete:(\\|*/|){{ expand('%:t:r') }}:
[[ -f $realpath ]] && {{ expand('%:t:r') }} $realpath || less $realpath
