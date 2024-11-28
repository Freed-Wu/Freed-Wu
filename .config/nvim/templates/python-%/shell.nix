{
  pkgs ? import <nixpkgs> { },
}:

with pkgs;
mkShell {
  name = "{{ expand('%:p:h:t') }}";
  buildInputs = [
    stdenv.cc
    pkg-config

    (python3.withPackages (
      p: with p; [
        uv
        pytest

        meson-python
        cython
        autopxd2
      ]
    ))
  ];
}
