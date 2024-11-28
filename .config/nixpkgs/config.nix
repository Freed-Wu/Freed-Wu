(import /etc/nixos/configuration.nix rec {
  config = null;
  pkgs = import <nixpkgs>;
  lib = pkgs.lib;
}).nixpkgs.config
