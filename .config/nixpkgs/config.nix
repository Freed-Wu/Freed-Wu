{
  # nur.repos.xddxdd.wechat-uos
  permittedInsecurePackages = [
    "openssl-1.1.1w"
    "electron-19.1.9"
  ];
  allowUnfree = true;
  # https://github.com/NixOS/nixpkgs/issues/224921#issuecomment-1821202793
  # result in rebuilding
  # cudaSupport = true;
  packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
    # https://github.com/nix-community/nix-index-database/issues/69
    nix-index-database = (
      builtins.getFlake "github:nix-community/nix-index-database"
    ).packages.${builtins.currentSystem}.default;
  };
}
