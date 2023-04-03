TESTS = check_{{ expand('%:p:h:h:t') }}
check_PROGRAMS = check_{{ expand('%:p:h:h:t') }}
check_{{ expand('%:p:h:h:t') }}_SOURCES = check_{{ expand('%:p:h:h:t') }}.c $(top_builddir)/{{ expand('%:p:h:h:t') }}.c
check_{{ expand('%:p:h:h:t') }}_CFLAGS = @CHECK_CFLAGS@
check_{{ expand('%:p:h:h:t') }}_LDADD = @CHECK_LIBS@

check_{{ expand('%:p:h:h:t') }}.c: check_{{ expand('%:p:h:h:t') }}.c.in
	checkmk $< > $@
