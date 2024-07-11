# shellcheck shell=bash
has_cmd() {
	local opt
	for opt; do
		if command -v "$opt" >/dev/null; then
			continue
		else
			return $?
		fi
	done
}
alias mv='mv -i'
alias cp='cp -ri'
alias scp='scp -r'
alias rsync='rsync -avzP'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias rmdir='rmdir -p'
alias rename='rename -i'
# NixOS uses rename for perl-rename
if has_cmd perl-rename; then
	alias perl-rename='perl-rename -i'
fi
# https://github.com/sharkdp/bat/issues/2455
# sudo update-alternatives --install /usr/bin/bat bat /usr/bin/batcat 50
# https://github.com/sharkdp/fd/issues/1009
# sudo update-alternatives --install /usr/bin/fd fd /usr/bin/fdfind 50
# old ubuntu uses pudb3
# sudo update-alternatives --install /usr/bin/pudb pudb /usr/bin/pudb3 50
# https://github.com/NixOS/nixpkgs/pull/222667#issuecomment-1804096580
if has_cmd proxychains4 && ! has_cmd proxychains; then
	alias proxychains=proxychains4
fi
if has_cmd bear make; then
	alias make='bear -- make'
fi
if has_cmd eza; then
	alias ls='eza --icons --git -h'
	alias tree='eza --icons -T'
elif has_cmd exa; then
	alias ls='exa --icons -h'
	alias tree='exa --icons -T'
else
	alias ls='ls --color=auto -h'
fi
