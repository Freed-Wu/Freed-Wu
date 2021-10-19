#! /usr/bin/env bash
#? v0.0.1
##? usage: %FFILE% [options]
##?
##? options:
##?   -h, --help            Show this screen.
##?   -V, --version         Show version.
help=$(grep "^##?" "$0" | cut -c 5-)
version=$(grep "^#?" "$0" | cut -c 4-)
eval "$(docopts -h "$help" -V "$version" : "$@")"
