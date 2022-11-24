{ lib, stdenv, fetchFromGitHub }:
stdenv.mkDerivation rec {
  pname = "%DIR%";
  version = "";

  src = fetchFromGitHub {
    owner = "";
    repo = "%DIR%";
    rev = version;
    sha256 = "";
  };

  dontBuild = true;
  installFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    homepage = "https://github.com//%DIR%";
    description = "";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    platforms = platforms.unix;
  };
}
