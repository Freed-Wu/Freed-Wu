#!/usr/bin/env -S perl -n
next unless (m(^https://([^:]+):([^@]+)\@github.com$));
print "export HOMEBREW_GITHUB_PACKAGES_USER='$1'
export HOMEBREW_GITHUB_PACKAGES_TOKEN='$2'
";
last;
