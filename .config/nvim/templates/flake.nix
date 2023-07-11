{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        with nixpkgs.legacyPackages.${system};
        with python3.pkgs;
        {
          formatter = nixpkgs-fmt;
          packages.default = buildPythonApplication rec {
            pname = "{{ expand('%:p:h:t') }}";
            version = "";
            src = self;
            format = "pyproject";
            disabled = pythonOlder "3.6";
            propagatedBuildInputs = [
            ];
            nativeBuildInputs = [
              setuptools
            ];
            pythonImportsCheck = [
              "{{ substitute(expand('%:p:h:t'), '-', '_', 'g') }}"
            ];
          };
        }
      );
}
