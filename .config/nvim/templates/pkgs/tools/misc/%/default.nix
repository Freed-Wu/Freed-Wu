{ lib
, stdenv
, fetchFromGitHub
}:
stdenv.mkDerivation rec {
  pname = "{{ expand('%:p:h:t') }}";
  version = "";

  src = fetchFromGitHub {
    owner = "";
    repo = "{{ expand('%:p:h:t') }}";
    rev = version;
    sha256 = "";
  };

  dontBuild = true;
  installFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    homepage = "https://github.com/{{ split(g:snips_github, '/')[-1] }}/{{ expand('%:p:h:t') }}";
    description = "{% here %}";
    license = licenses.mit;
    maintainers = with maintainers; [ {{ split(g:snips_github, '/')[-1] }} ];
    platforms = platforms.unix;
  };
}
