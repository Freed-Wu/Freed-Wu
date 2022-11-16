#!/usr/bin/env bash
if [ "$USER" == root ]; then
	sudo() {
		"$@"
	}
fi
for file in requirements*.txt; do
	"./$file"
done
./main.py --print-completion bash | sudo tee /usr/share/bash-completion/completions/main.py
./main.py --print-completion tcsh | sudo tee /etc/profile.d/main.csh
./main.py --print-completion zsh | sudo tee /usr/share/zsh/site-functions/_main.py
