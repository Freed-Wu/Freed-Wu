#!/usr/bin/env -S nix eval --impure -f
"${(import <nixpkgs> {}).openssl.out}/lib"
