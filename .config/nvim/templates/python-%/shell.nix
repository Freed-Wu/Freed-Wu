{
  pkgs ? import <nixpkgs> { },
}:

with pkgs;
mkShell {
  name = "{{ expand('%:p:h:t') }}";
  buildInputs = [
    stdenv.cc
    pkg-config
    meson
    ninja

    (python3.withPackages (
      p: with p; [
        build
        pytest
        pytest-pudb
        pudb

        cython
      ]
    ))
  ];
}
