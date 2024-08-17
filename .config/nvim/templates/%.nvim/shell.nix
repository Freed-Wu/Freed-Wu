{ pkgs ? import <nixpkgs> { } }:

with pkgs;
mkShell {
  name = "{{ expand('%:p:h:t') }}";
  buildInputs = [
    pkg-config
    stdenv.cc
    luajit
  ];
}
