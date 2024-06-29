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
if has_cmd perl-rename; then
	alias perl-rename='perl-rename -i'
fi
if has_cmd fdfind && ! has_cmd fd; then
	alias fd=fdfind
fi
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
