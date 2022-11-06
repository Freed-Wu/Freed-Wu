#!/usr/bin/env bash
#? 0.0.1
#? Copyright (C) %YEAR%
#? Written by %USER%
##? Usage: %FFILE% [options]
##?
##? Options:
##?   -h, --help            Show this screen.
##?   -V, --version         Show version.
##?
##? Report bugs to <%MAIL%>.
help=$(grep "^##?" "$0" | cut -c 5-)
version=$(grep "^#?" "$0" | cut -c 4-)
eval "$(docopts -h "$help" -V "$version" : "$@")"
