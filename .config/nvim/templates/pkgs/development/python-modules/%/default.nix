{ mySources
, python3
, lib
, setuptools-generate
}:

with python3.pkgs;

buildPythonPackage rec {
  inherit (mySources.{{ expand('%:p:h:t') }}) pname version src;
  format = "pyproject";
  disabled = pythonOlder "3.6";
  propagatedBuildInputs = [
  ];
  nativeBuildInputs = [
    setuptools-generate
  ];
  pythonImportsCheck = [
    "{{ substitute(expand('%:p:h:t'), '-', '_', 'g') }}"
  ];

  meta = with lib; {
    homepage = "https://{{ expand('%:p:h:t') }}.readthedocs.io";
    description = "{% here %}";
    license = licenses.gpl3;
    maintainers = with maintainers; [ {{ split(g:snips_github, '/')[-1] }} ];
    platforms = platforms.unix;
  };
}
