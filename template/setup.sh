#!/usr/bin/env bash
pip config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple
pip config set global.extra-index-url https://developer.download.nvidia.com/compute/redist
./requirements.txt
for file in requirements/*.txt; do
  $file
done
./main.py --print-completion bash | sudo tee /usr/share/bash-completion/completions/main.py
./main.py --print-completion zsh | sudo tee /usr/share/zsh/site-functions/_main.py
