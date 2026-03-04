bin_PROGRAMS = src/{{ expand('%:p:h:t') }}$(EXEEXT)
{{ expand('%:p:h:t') }}_SOURCES = src/{{ expand('%:p:h:t') }}.c

dist_doc_DATA = README.md
dist_man_MANS = data/{{ expand('%:p:h:t') }}.1
bashcompletiondir = $(datadir)/bash-completion/completions
dist_bashcompletion_DATA = data/{{ expand('%:p:h:t') }}
zshcompletiondir = $(datadir)/zsh/site-functions
dist_zshcompletion_DATA = data/_{{ expand('%:p:h:t') }}
desktopdir = $(datadir)/applications
dist_desktop_DATA = assets/desktop/{{ expand('%:p:h:t') }}.desktop
icondir = $(datadir)/icons/hicolor/256x256/apps
dist_icon_DATA = src/{{ substitute(expand('%:p:h:t'), '-', '_', 'g') }}/assets/images/{{ expand('%:p:h:t') }}.png

{{ expand('%:p:h:t') }}.1: {{ expand('%:p:h:t') }}$(EXEEXT)
	help2man --output={{ expand('%:p:h:t') }}.1 ./{{ expand('%:p:h:t') }}$(EXEEXT)
