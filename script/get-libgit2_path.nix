#!/usr/bin/env -S nix eval --impure -f
"${(import <nixpkgs> {}).libgit2.lib}/lib/libgit2."
