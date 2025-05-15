# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  lib,
  ...
}:

let
  nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
    inherit pkgs;
  };
in
rec {
  # basic {{{ #
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
  ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.trusted-users = [
    "root"
    "@wheel"
  ];
  nix.settings.substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
  nix.settings.use-xdg-base-directories = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.tmp.useTmpfs = true;

  nixpkgs.config = {
    allowUnfree = true;
    # https://github.com/NixOS/nixpkgs/issues/224921#issuecomment-1821202793
    # result in rebuilding
    # cudaSupport = true;
    packageOverrides =
      pkgs:
      let
        rimeDataPkgs = with pkgs; [
          rime-data
          rime-japanese
          nur.repos.Freed-Wu.rime-kaomoji
        ];
      in
      {
        # https://github.com/nix-community/nix-index-database/issues/69
        nix-index-database =
          (builtins.getFlake "github:nix-community/nix-index-database")
          .packages.${builtins.currentSystem}.default;
        # https://github.com/rime/home/discussions/1206#discussioncomment-10092637
        librime = (pkgs.librime.override { plugins = [ ]; });
        fcitx5-rime = (pkgs.fcitx5-rime.override { rimeDataPkgs = rimeDataPkgs; });
        ibus-engines.rime = (pkgs.ibus-engines.rime.override { rimeDataPkgs = rimeDataPkgs; });
      };
  };
  hardware.enableAllFirmware = true;
  hardware.bluetooth.enable = true;
  hardware.sensor.iio.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.graphics.extraPackages = with pkgs; [
    # intel-ocl
    intel-compute-runtime
  ];

  security.sudo.wheelNeedsPassword = false;

  networking.hostName = "laptop";
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  time.timeZone = "Asia/Shanghai";

  console.font = "latarcyrheb-sun32";
  console.useXkbConfig = true; # use xkbOptions in tty.

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users.wzy.isNormalUser = true;
  users.users.wzy.description = "Wu, Zhenyu";
  users.users.wzy.extraGroups = [
    "wheel"
    "networkmanager"
    "input"
    "docker"
    "dialout"
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
  environment.shellAliases = {
    l = null;
    ll = null;
  };
  # }}} basic #

  # GUI {{{ #
  # Select internationalisation properties.
  i18n.inputMethod.enable = true;
  i18n.inputMethod.type =
    if services.displayManager.defaultSession == "gnome" then "ibus" else "fcitx5";
  i18n.inputMethod.fcitx5.addons = with pkgs; [
    fcitx5-rime
  ];
  i18n.inputMethod.ibus.engines = with pkgs.ibus-engines; [
    rime
  ];

  fonts.fontDir.enable = true;
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    wqy_zenhei
    wqy_microhei
    nerd-fonts.jetbrains-mono
  ];
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.libinput.enable = true;
  # Configure keymap in X11
  # gnome 47.1 and plasma on wayland display incorrectly for HiDPI
  services.displayManager.defaultSession = "plasma";
  services.desktopManager.gnome.enable = services.displayManager.defaultSession == "gnome";
  services.displayManager.gdm.enable = services.displayManager.defaultSession == "gnome";

  services.desktopManager.plasma6.enable = services.displayManager.defaultSession == "plasma";
  services.displayManager.sddm.enable = services.displayManager.defaultSession == "plasma";
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.settings = {
    # https://wiki.archlinux.org/title/SDDM#Enable_HiDPI
    General = {
      GreeterEnvironment = "QT_SCREEN_SCALE_FACTORS=2,QT_FONT_DPI=96";
    };
    # https://wiki.archlinux.org/title/SDDM#DPI_settings
    X11 = {
      ServerArguments = "-nolisten tcp -dpi 94";
    };
  };

  services.xserver.desktopManager.lxqt.enable = services.displayManager.defaultSession == "lxqt";

  services.xserver.desktopManager.xfce.enable = services.displayManager.defaultSession == "xfce";

  services.xserver.displayManager.lightdm.greeters.slick.font.name = "Ubuntu 24";

  # https://discourse.nixos.org/t/how-to-use-fingerprint-unlocking-how-to-set-up-fprintd-english/21901/2
  # services.fprintd.enable = true;
  # services.fprintd.tod.enable = true;
  # services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;
  services.picom.enable =
    services.displayManager.defaultSession != "gnome"
    && services.displayManager.defaultSession != "plasma";
  services.picom.fade = true;
  services.picom.inactiveOpacity = 0.95;
  services.picom.settings = {
    blur = {
      kern = "3x3box";
      background-exclude = [
        "class_g ?= 'zoom'"
        "window_type = 'dock'"
        "class_g ?= 'wemeetapp'"
        "name = 'rect-overlay'"
        "window_type = 'desktop'"
        "_GTK_FRAME_EXTENTS@:c"
      ];
    };
    shadow = true;
    shadowExclude = [
      "name = 'cpt_frame_xcb_window'"
      "class_g ?= 'zoom'"
      "class_g ?= 'wemeetapp'"
      "name = 'rect-overlay'"
      "name = 'Notification'"
      "class_g = 'Conky'"
      "class_g ?= 'Notify-osd'"
      "class_g = 'Cairo-clock'"
      "_GTK_FRAME_EXTENTS@:c"
    ];
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.xserver.excludePackages = [
    pkgs.xterm
  ];

  environment.lxqt.excludePackages = [
    pkgs.lxqt.qterminal
  ];
  environment.xfce.excludePackages = [
    pkgs.xfce.xfce4-terminal
  ];
  environment.gnome.excludePackages = with pkgs; [
    gnome-console
    gedit
    epiphany
    evince
  ];
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    kate
    konqueror
    okular
  ];
  # }}} GUI #

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    with pkgs;
    [
      nur.repos.Freed-Wu.proxychains-symlinks
      nur.repos.Freed-Wu.gopass-symlinks
      man-pages
      man-pages-posix
      windows10-icons
      nur.repos.Freed-Wu.windows10-themes
      # https://github.com/NixOS/nixpkgs/issues/298639
      nur.repos.Freed-Wu.stardict-ecdict
      nur.repos.Freed-Wu.stardict-langdao-ce-gb
      nur.repos.Freed-Wu.stardict-langdao-ec-gb
      nur.repos.Freed-Wu.stardict-jmdict-ja-en
      nur.repos.Freed-Wu.stardict-jmdict-en-ja
      # python {{{ #
      (python3.withPackages (
        p: with p; [
          # tool
          keyring-pass
          # develop
          uv
          # misc
          # https://github.com/NixOS/nixpkgs/issues/373667
          # esbonio
          nur.repos.Freed-Wu.pyrime
          nur.repos.Freed-Wu.translate-shell
          nur.repos.Freed-Wu.mutt-language-server
          nur.repos.Freed-Wu.tmux-language-server
          nur.repos.Freed-Wu.zathura-language-server
          nur.repos.Freed-Wu.autotools-language-server
          nur.repos.Freed-Wu.termux-language-server
          nur.repos.Freed-Wu.requirements-language-server
          nur.repos.Freed-Wu.sublime-syntax-language-server
          nur.repos.Freed-Wu.expect-language-server
          nur.repos.Freed-Wu.xilinx-language-server
        ]
      ))
      vim-vint
      yamllint
      trash-cli
      visidata
      asciinema
      pdd
      # http://github.com/zpm-zsh/colorize
      grc
      pre-commit
      doq
      # https://github.com/NixOS/nixpkgs/issues/375763
      # bitbake-language-server
      # }}} python #
      # perl {{{ #
      (perl.withPackages (
        p: with p; [
          PerlTidy
          PerlLanguageServer
        ]
      ))
      rename
      exiftool
      parallel
      # }}} perl #
      # ruby {{{ #
      (ruby.withPackages (
        p: with p; [
          solargraph
          rubocop
        ]
      ))
      # }}} ruby #
      # jq {{{ #
      nur.repos.Freed-Wu.jq-emojify
      # }}} jq #
      # shell {{{ #
      wgetpaste
      hr
      has
      lesspipe
      blesh
      bash-completion
      zsh-completions
      zsh-powerlevel10k
      nur.repos.Freed-Wu.manpager
      nur.repos.Freed-Wu.undollar
      nur.repos.Freed-Wu.bash-prompt
      # }}} shell #
      # nodejs {{{ #
      nodejs
      gitmoji-cli
      # TODO: https://github.com/NixOS/nixpkgs/pull/245016
      # nodePackages.gitmoji-chanagelog
      # }}} nodejs #
      # lua {{{ #
      lua-language-server
      fennel-ls
      fnlfmt
      (
        # https://github.com/luarocks/luarocks/issues/1797
        # luaJIT doesn't support #table > 65536
        lua5_1.withPackages (
          p: with p; [
            # pre-commit needs it
            luarocks
          ]
        )
      )
      # }}} lua #
      # tcl {{{ #
      nagelfar
      # }}} tcl #
      # rust {{{ #
      # pre-commit needs it
      cargo
      rustc
      # nix
      manix
      nix-index-database
      # GUI
      firefox
      # https://github.com/wez/wezterm/issues/792
      # https://github.com/wez/wezterm/issues/3766
      # https://github.com/alacritty/alacritty/issues/4070
      alacritty
      # tool
      eza
      ripgrep
      ripgrep-all
      fd
      hexyl
      vivid
      onefetch
      asciinema-agg
      # monitor
      bottom
      hyperfine
      # syntax highlight
      bat
      delta
      mdcat
      # LSP
      ruff
      biome
      taplo
      neocmakelsp
      asm-lsp
      texlab
      tinymist
      # }}} rust #
      # go {{{ #
      # pre-commit needs it
      go
      # tool
      git-lfs
      gopass
      fq
      fzf
      direnv
      gh
      wakatime
      scc
      gdu
      # linter
      actionlint
      # formatter
      shfmt
      # LSP
      jq-lsp
      # }}} go #
      # haskell {{{ #
      # pre-commit needs it for haskell hooks
      cabal-install
      ghc
      # linter
      shellcheck
      # formatter
      # nixd uses it
      nixfmt-rfc-style
      # }}} haskell #
      # f# {{{ #
      marksman
      # }}} f# #
      # java {{{ #
      # coc-xml needs it
      jre_minimal
      plantuml
      pdftk
      ltex-ls
      # }}} java #
      # c {{{ #
      # info {{{ #
      pciutils
      usbutils
      psmisc
      progress
      # }}} info #
      # build {{{ #
      bear
      # }}} build #
      tmux
      lsof
      poppler_utils
      nmap
      fontconfig
      imagemagick
      sqlite
      neomutt
      curl
      git
      subversion
      file
      dos2unix
      android-tools
      scrcpy
      linux-firmware
      p7zip
      # replace unrar
      unar
      w3m
      elinks
      # calculator
      jq
      zathura
      ffmpeg
      moreutils
      espeak-classic
      fastfetch
      # for lesspipe to view *.rpm
      rpm
      # for lesspipe to view *.deb
      dpkg
      nur.repos.Freed-Wu.tmux-rime
      # }}} c #
      # c++ {{{ #
      krita
      # qmlls
      kdePackages.qtdeclarative
      # https://github.com/neocmakelsp/neocmakelsp/discussions/167
      cmake
      mesonlsp
      openai-triton-llvm
      watchman
      cppcheck
      nixd
      clang-tools
      cling
      aria2
      lftp
      yuview
      chafa
      patchelf
      qq
      # https://github.com/NixOS/nixpkgs/pull/354332
      wechat-uos
      wemeet
      qqmusic
      # TODO: https://github.com/NixOS/nixpkgs/pull/243429
      # nur.repos.Freed-Wu.netease-cloud-music
      # }}} c++ #
    ]
    # don't use libreoffice-fresh to avoid building
    ++ (
      if services.desktopManager.plasma6.enable then
        [
          libreoffice-qt
          kdePackages.kdeconnect-kde
        ]
      else if services.desktopManager.gnome.enable then
        [
          libreoffice
          gnome-tweaks
          gnome-randr
          # https://extensions.gnome.org/extension/5263/gtk4-desktop-icons-ng-ding/
          gnomeExtensions.gtk4-desktop-icons-ng-ding
          gnomeExtensions.clipboard-indicator
          gnomeExtensions.appindicator
          gnomeExtensions.screen-rotate
          gnomeExtensions.valent
          valent
        ]
      else
        [
          libreoffice-qt
          kdePackages.kdeconnect-kde
        ]
    )
    ++ (lib.optionals
      (
        hardware.graphics ? extraPackages
        && builtins.elem intel-compute-runtime hardware.graphics.extraPackages
      )
      [
        intel-gpu-tools
      ]
    )
    ++ (
      if
        services.displayManager.gdm ? wayland
        && !services.displayManager.gdm.wayland
        && services.displayManager.gdm.enable
      then
        [ xsel ]
      else
        [
          wayclip
        ]
    );

  # program {{{ #
  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";
  virtualisation.docker.autoPrune.enable = true;
  virtualisation.docker.rootless.enable = true;
  virtualisation.docker.rootless.setSocketVariable = true;

  services.dockerRegistry.enable = true;
  services.dockerRegistry.enableDelete = true;
  services.dockerRegistry.enableGarbageCollect = true;
  services.v2raya.enable = true;

  programs.nix-ld.enable = true;
  programs.proxychains.enable = true;
  programs.proxychains.proxies = {
    myproxy = {
      type = "socks5";
      host = "127.0.0.1";
      port = 1080;
    };
  };
  programs.less.envVariables = {
    LESS = "--mouse -S -I -R -M";
  };
  programs.tmux.terminal = "screen-256color";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.zsh.enable = true;
  programs.zsh.enableBashCompletion = true;
  programs.zsh.enableGlobalCompInit = true;
  programs.zsh.autosuggestions.async = true;
  programs.zsh.setOptions = [
    "HIST_IGNORE_DUPS"
    "SHARE_HISTORY"
    "HIST_FCNTL_LOCK"
    "emacs"
  ];
  programs.zsh.histSize = 20000;
  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;
  programs.nano.enable = false;
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  programs.neovim.vimAlias = true;
  programs.neovim.viAlias = true;
  programs.neovim.withNodeJs = true;
  programs.neovim.configure = {
    customRC = ''
      if filereadable(stdpath('config') . '/init.vim')
        execute 'source' stdpath('config') . '/init.vim'
      endif
    '';
  };
  # }}} program #
}
# ex: foldmethod=marker
