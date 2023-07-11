{
  allowUnfree = true;
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
    # https://github.com/nix-community/nix-index-database/issues/69
    nix-index-database = (
      builtins.getFlake "github:nix-community/nix-index-database"
    ).packages.${builtins.currentSystem}.default;
  };
}
