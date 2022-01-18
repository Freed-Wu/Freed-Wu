# Set-ExecutionPolicy RemoteSigned
# Install-Module posh-git -Scope CurrentUser -Force -Verbose
# Install-Module oh-my-posh -Scope CurrentUser -Force -Verbose
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt paradox
Set-PSReadLineOption -EditMode Emacs
