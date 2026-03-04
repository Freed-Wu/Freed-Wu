SUBDIRS = tests

bin_PROGRAMS = {{ expand('%:p:h:h:t') }}
{{ expand('%:p:h:h:t') }}_SOURCES = {{ expand('%:p:h:h:t') }}.c
dist_man_MANS = {{ expand('%:p:h:h:t') }}.1

{{ expand('%:p:h:h:t') }}.1: {{ expand('%:p:h:h:t') }}$(EXEEXT)
	help2man --output={{ expand('%:p:h:h:t') }}.1 ./{{ expand('%:p:h:h:t') }}$(EXEEXT)
