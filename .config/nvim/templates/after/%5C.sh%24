#!/usr/bin/env bash
#? 0.0.1
#? Copyright (C) {{ strftime('%Y') }}
#? Written by {{ g:snips_author }}
##? Usage: {{ expand('%:t') }} [options]
##?
##? Options:
##?   -h, --help            Show this screen.
##?   -V, --version         Show version.
##?
##? Report bugs to <{{ g:snips_email }}>.
help=$(grep "^##?" "$0" | cut -c 5-)
version=$(grep "^#?" "$0" | cut -c 4-)
eval "$(docopts -h "$help" -V "$version" : "$@")"
