#!/usr/bin/env bash
set -e
cd "$(dirname "$(readlink -f "$0")")/.."

git ls-files | xargs -I{} rm -r '{}'
git restore README.md Gemfile _config.yml
git add -A
git config --global user.name 'Github Actions'
git config --global user.email '41898282+github-actions[bot]@users.noreply.github.com'
git commit -m 'Avoid slow speed of github actions to access mirrors, liquid syntax error, wrong symlinks'
