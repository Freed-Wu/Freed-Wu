# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

let
  rimeDataPkgs = with pkgs; [
    rime-data
    nur.repos.Freed-Wu.rime-kaomoji
    nur.repos.Freed-Wu.rime-japanese
  ];
in
rec {
  # basic {{{ #
  imports =
    [
      # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "root" "@wheel" ];
  nix.settings.substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
  nix.settings.use-xdg-base-directories = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.tmp.useTmpfs = true;

  nixpkgs.config = import ~/.config/nixpkgs/config.nix;
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
  users.users.wzy.extraGroups = [ "wheel" "networkmanager" "input" "docker" "dialout" ];

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
  # }}} basic #

  # GUI {{{ #
  # Select internationalisation properties.
  i18n.inputMethod.enable = true;
  i18n.inputMethod.type =
    if
      services.displayManager.defaultSession == "gnome" then
      "ibus"
    else
      "fcitx5";
  i18n.inputMethod.fcitx5.addons = with pkgs; [
    (fcitx5-rime.override { rimeDataPkgs = rimeDataPkgs; })
  ];
  i18n.inputMethod.ibus.engines = with pkgs.ibus-engines; [
    (rime.override { rimeDataPkgs = rimeDataPkgs; })
  ];

  fonts.fontDir.enable = true;
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    wqy_zenhei
    wqy_microhei
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.libinput.enable = true;
  # Configure keymap in X11
  services.displayManager.defaultSession = "gnome";
  services.xserver.desktopManager.gnome.enable = services.displayManager.defaultSession == "gnome";
  services.xserver.displayManager.gdm.enable = services.displayManager.defaultSession == "gnome";

  services.xserver.desktopManager.plasma5.enable = services.displayManager.defaultSession == "plasma";
  services.displayManager.sddm.enable = services.displayManager.defaultSession == "plasma";

  services.xserver.desktopManager.lxqt.enable = services.displayManager.defaultSession == "lxqt";

  services.xserver.desktopManager.xfce.enable = services.displayManager.defaultSession == "xfce";

  services.xserver.displayManager.lightdm.greeters.slick.font.name = "Ubuntu 24";

  # https://discourse.nixos.org/t/how-to-use-fingerprint-unlocking-how-to-set-up-fprintd-english/21901/2
  # services.fprintd.enable = true;
  # services.fprintd.tod.enable = true;
  # services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;
  services.picom.enable = services.displayManager.defaultSession != "gnome" && services.displayManager.defaultSession != "plasma";
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
  environment.gnome.excludePackages = [
    pkgs.gnome-console
    pkgs.gedit
    pkgs.epiphany
    pkgs.evince
  ];
  environment.plasma5.excludePackages = [
    pkgs.plasma5Packages.konsole
    pkgs.plasma5Packages.kate
    pkgs.plasma5Packages.konqueror
    pkgs.plasma5Packages.okular
  ];
  # }}} GUI #

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs;
    [
      man-pages
      man-pages-posix
      glibcInfo
      windows10-icons
      nur.repos.Freed-Wu.windows10-themes
      # https://github.com/NixOS/nixpkgs/issues/298639
      nur.repos.Freed-Wu.stardict-ecdict
      nur.repos.Freed-Wu.stardict-langdao-ce-gb
      nur.repos.Freed-Wu.stardict-langdao-ec-gb
      nur.repos.Freed-Wu.stardict-jmdict-ja-en
      nur.repos.Freed-Wu.stardict-jmdict-en-ja
      # python {{{ #
      (
        python3.withPackages (
          p: with p; [
            # tool
            # https://github.com/petronny/pinyin-completion
            pypinyin
            gdown
            # https://github.com/NixOS/nixpkgs/issues/352426
            # keyring-pass
            # PKGBUILD
            nvchecker
            # develop
            pip
            build
            # debug
            ptpython
            pudb
            pytest
            pytest-pudb
            # data science
            beautifulsoup4
            lxml
            pandas
            # deep learning
            openai
            # https://github.com/NixOS/nixpkgs/issues/280861
            # wandb
            tensorboard
            torchWithoutCuda
            torchvision
            torchmetrics
            # misc
            # wxpython doesn't support python 3.12
            # nur.repos.Freed-Wu.mulimgviewer
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
        )
      )
      # mesonlsp needs it
      meson
      vim-vint
      yamllint
      trash-cli
      visidata
      asciinema
      asciinema-agg
      pdd
      # http://github.com/zpm-zsh/colorize
      grc
      pre-commit
      doq
      ruff-lsp
      bitbake-language-server
      nur.repos.mic92.gdb-dashboard
      # }}} python #
      # perl {{{ #
      (
        perl.withPackages (
          p: with p; [
            PerlTidy
            PerlLanguageServer
          ]
        )
      )
      rename
      exiftool
      parallel
      # }}} perl #
      # ruby {{{ #
      (
        ruby.withPackages (
          p: with p; [
            solargraph
            rubocop
            pry
          ]
        )
      )
      # }}} ruby #
      # nodejs {{{ #
      nodejs
      yarn-berry
      web-ext
      gitmoji-cli
      alex
      write-good
      nodePackages.ts-node
      # TODO: https://github.com/NixOS/nixpkgs/pull/245016
      # nodePackages.gitmoji-chanagelog
      # }}} nodejs #
      # lua {{{ #
      lua-language-server
      (
        # rocks.nvim needs luarocks 5.1
        luajit.withPackages (
          p: with p; [
            # pre-commit needs it
            luarocks-nix
            luasec
            nur.repos.Freed-Wu.luajit-prompt-style
          ]
        )
      )
      # }}} lua #
      # tcl {{{ #
      nagelfar
      # }}} tcl #
      # rust {{{ #
      evcxr
      rustc
      taplo
      manix
      nix-index-database
      tree-sitter
      nixpkgs-fmt
      neocmakelsp
      # pre-commit needs it
      cargo
      firefox
      # https://github.com/wez/wezterm/issues/792
      # https://github.com/wez/wezterm/issues/3766
      # https://github.com/alacritty/alacritty/issues/4070
      alacritty
      onefetch
      mdcat
      eza
      fd
      vivid
      delta
      bat
      ripgrep
      ripgrep-all
      bottom
      hexyl
      hyperfine
      texlab
      typst
      typstfmt
      typst-lsp
      asm-lsp
      # }}} rust #
      # go {{{ #
      # pre-commit needs it
      go
      gopass
      fq
      jq-lsp
      actionlint
      fzf
      scc
      direnv
      gh
      wakatime
      gdu
      shfmt
      git-lfs
      cog
      nix-build-uncached
      # }}} go #
      # jq {{{ #
      nur.repos.Freed-Wu.jq-emojify
      # }}} jq #
      # shell {{{ #
      wgetpaste
      hr
      has
      lesspipe
      bats
      bats.libraries.bats-support
      bats.libraries.bats-assert
      blesh
      bash-completion
      zsh-completions
      zsh-powerlevel10k
      nur.repos.Freed-Wu.manpager
      nur.repos.Freed-Wu.undollar
      nur.repos.Freed-Wu.bash-prompt
      # }}} shell #
      # haskell {{{ #
      haskellPackages.nvfetcher
      haskellPackages.ShellCheck
      haskellPackages.pandoc-cli
      haskellPackages.cachix
      # }}} haskell #
      # f# {{{ #
      marksman
      # }}} f# #
      # java {{{ #
      jdk
      plantuml
      pdftk
      ltex-ls
      # }}} java #
      # c {{{ #
      # info {{{ #
      glxinfo
      vulkan-tools
      drm_info
      clinfo
      libinput
      evtest
      pciutils
      usbutils
      ethtool
      psmisc
      progress
      dmidecode
      # }}} info #
      # build {{{ #
      # meson needs it
      pkg-config
      bear
      # pre-comit call luarocks, then luarocks call it for building
      gnumake
      # }}} build #
      # debug {{{ #
      cgdb
      gdb
      rr
      valgrind
      nur.repos.Freed-Wu.gdb-prompt
      # }}} debug #
      # pyproject-build needs it
      gcc
      tmux
      lsof
      poppler_utils
      minicom
      socat
      nmap
      fontconfig
      imagemagick
      sqlite
      hello
      lsb-release
      neomutt
      wget
      curl
      git
      subversion
      file
      dos2unix
      android-tools
      scrcpy
      texlive.combined.scheme-full
      linux-firmware
      (p7zip.override { enableUnfree = true; })
      w3m
      elinks
      jq
      acpi
      zathura
      ffmpeg
      moreutils
      bc
      num-utils
      espeak-classic
      fastfetch
      nur.repos.Freed-Wu.tmux-rime
      # }}} c #
      # c++ {{{ #
      krita
      # neocmakelsp needs it
      cmake
      mesonlsp
      openai-triton-llvm
      libreoffice-fresh
      # wpsoffice
      watchman
      cppcheck
      nixd
      qq
      clang-tools
      cling
      aria2
      lftp
      yuview
      luaformatter
      chafa
      patchelf
      ansifilter
      wechat-uos
      nur.repos.linyinfeng.wemeet
      # TODO: https://github.com/NixOS/nixpkgs/pull/243429
      nur.repos.Freed-Wu.netease-cloud-music
      # nur.repos.xddxdd.qqmusic
      # }}} c++ #
    ] ++ (lib.optionals services.xserver.desktopManager.gnome.enable
      [
        gnome-tweaks
        gnome-randr
        # https://extensions.gnome.org/extension/5263/gtk4-desktop-icons-ng-ding/
        gnomeExtensions.gtk4-desktop-icons-ng-ding
        gnomeExtensions.clipboard-indicator
        gnomeExtensions.appindicator
        gnomeExtensions.screen-rotate
      ]) ++ (lib.optionals
      (
        hardware.graphics ? extraPackages && builtins.elem intel-compute-runtime hardware.graphics.extraPackages
      )
      [
        intel-gpu-tools
      ])
    ++ (
      # wl-clipboard breaks vim / firefox
      # if services.xserver.displayManager.gdm ? wayland && ! services.xserver.displayManager.gdm.wayland then
      [ xsel ]
      # https://github.com/YaLTeR/wl-clipboard-rs/issues/8
      # else [ wl-clipboard ]
    )
  ;

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
  programs.zsh.setOptions = [ "HIST_IGNORE_DUPS" "SHARE_HISTORY" "HIST_FCNTL_LOCK" "emacs" ];
  programs.zsh.histSize = 20000;
  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;
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
