#!/usr/bin/env zsh
echo "export DEBFULLNAME='$(git config --global user.name)'
export DEBEMAIL='$(git config --global user.email)'" > debmake.sh
