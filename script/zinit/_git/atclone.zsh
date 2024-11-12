#!/usr/bin/env zsh
# debmake
# debhelper
echo "export DEBFULLNAME='$(git config --global user.name)'
export DEBEMAIL='$(git config --global user.email)'
export DEB_BUILD_OPTIONS=parallel=$(nproc)" > debmake.sh
