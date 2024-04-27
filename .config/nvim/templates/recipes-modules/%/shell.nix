{ pkgs ? import <nixpkgs> { } }:

with pkgs;
mkShell {
  name = "{{ expand('%:p:h:t') }}";
  buildInputs = [
    linuxPackages_latest.kernel.dev
  ];
}
