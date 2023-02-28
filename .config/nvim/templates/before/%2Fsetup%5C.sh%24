#!/usr/bin/env bash
{{ expand('%:p:h:h:t') }} --print-completion bash | sudo tee /usr/share/bash-completion/completions/{{ expand('%:p:h:h:t') }}.py
{{ expand('%:p:h:h:t') }} --print-completion tcsh | sudo tee /etc/profile.d/{{ expand('%:p:h:h:t') }}.csh
{{ expand('%:p:h:h:t') }} --print-completion zsh | sudo tee /usr/share/zsh/site-functions/_{{ expand('%:p:h:h:t') }}.py
