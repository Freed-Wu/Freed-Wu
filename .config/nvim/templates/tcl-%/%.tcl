package ifneeded {{ substitute(expand('%:p:h:t'), '^tcl-', '', '') }} 0.0.1 [list source [file join $dir {{ substitute(expand('%:p:h:t'), '^tcl-', '', '') }}.tcl]]
