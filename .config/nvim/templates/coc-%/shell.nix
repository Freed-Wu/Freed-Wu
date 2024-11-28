{ pkgs ? import <nixpkgs> { } }:

with pkgs;
mkShell {
  name = "{{ expand('%:p:h:t') }}";
  buildInputs = [
    stdenv.cc
    pkg-config
    xmake

    nodejs
  ];
  # https://github.com/NixOS/nixpkgs/issues/314313#issuecomment-2134252094
  shellHook = ''
    LD="$CC"
  '';
}
