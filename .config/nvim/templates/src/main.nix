#!/usr/bin/env -S nix eval --json -f
(import <nixpkgs> {}).linuxPackages_latest.kernel.dev
