Set-PSReadLineOption -EditMode Emacs
# https://github.com/dahlbyk/posh-git/issues/845
$env:POSHGIT_CYGWIN_WARNING = "off"
Import-Module posh-git
# https://github.com/JanDeDobbeleer/oh-my-posh/issues/2265
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\parabox.omp.json" | Invoke-Expression
