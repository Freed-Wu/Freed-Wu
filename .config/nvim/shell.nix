{ pkgs ? import <nixpkgs> { } }:

with pkgs;
mkShell {
  name = "nvim";
  buildInputs = [
    tree-sitter
  ];
}
