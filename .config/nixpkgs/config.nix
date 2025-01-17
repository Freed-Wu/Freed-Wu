{
  # nur.repos.xddxdd.wechat-uos
  permittedInsecurePackages = [
    "openssl-1.1.1w"
    "electron-19.1.9"
    # https://github.com/xddxdd/nur-packages
    "nix-2.16.2"
  ];
  allowUnfree = true;
  # https://github.com/NixOS/nixpkgs/issues/224921#issuecomment-1821202793
  # result in rebuilding
  # cudaSupport = true;
  packageOverrides = pkgs: rec {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
    # https://github.com/nix-community/nix-index-database/issues/69
    nix-index-database =
      (builtins.getFlake "github:nix-community/nix-index-database")
      .packages.${builtins.currentSystem}.default;
    # https://github.com/xddxdd/nur-packages/issues/49
    wechat-uos =
      (builtins.getFlake "github:xddxdd/nur-packages")
      .packages.${builtins.currentSystem}.wechat-uos-without-sandbox;
    # https://github.com/rime/home/discussions/1206#discussioncomment-10092637
    librime = (pkgs.librime.override { plugins = [ ]; });
    nerdfonts = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
    p7zip = (pkgs.p7zip.override { enableUnfree = true; });
    rimeDataPkgs = with pkgs; [
      rime-data
      rime-japanese
      nur.repos.Freed-Wu.rime-kaomoji
    ];
    fcitx5-rime = (pkgs.fcitx5-rime.override { rimeDataPkgs = rimeDataPkgs; });
    ibus-engines.rime = (pkgs.ibus-engines.rime.override { rimeDataPkgs = rimeDataPkgs; });
  };
}
