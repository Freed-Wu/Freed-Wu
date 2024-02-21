#!/usr/bin/env -S nix eval --impure  -f
let arr = builtins.split "-" "${(import <nixpkgs> {}).system}";
in "${(import <nixpkgs> {}).glibc}/lib/ld-${builtins.elemAt arr 2}-${
    builtins.replaceStrings ["_"] ["-"] (builtins.elemAt arr 0)}.so.2"
