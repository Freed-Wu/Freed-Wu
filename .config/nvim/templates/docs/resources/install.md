# Install

## [AUR](https://aur.archlinux.org/packages/{{ expand('%:p:h:h:h:t') }})

```sh
yay -S python-{{ expand('%:p:h:h:h:t') }}
```

## [NUR](https://nur.nix-community.org/repos/{{ split(g:snips_github, '/')[-1] }})

```nix
{ config, pkgs, ... }:
{
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import
      (
        builtins.fetchTarball
          "https://github.com/nix-community/NUR/archive/master.tar.gz"
      )
      {
        inherit pkgs;
      };
  };
  environment.systemPackages = with pkgs;
      (
        python3.withPackages (
          p: with p; [
            nur.repos.{{ split(g:snips_github, '/')[-1] }}.{{ expand('%:p:h:h:h:t') }}
          ]
        )
      )
}
```

## [Nix](https://nixos.org)

```sh
nix shell github:{{ split(g:snips_github, '/')[-1] }}/{{ expand('%:p:h:h:h:t') }}
```

Run without installation:

```sh
nix run github:{{ split(g:snips_github, '/')[-1] }}/{{ expand('%:p:h:h:h:t') }} -- --help
```

## [PYPI](https://pypi.org/project/{{ expand('%:p:h:h:h:t') }})

```sh
pip install {{ expand('%:p:h:h:h:t') }}
```

See [requirements](requirements) to know `extra_requires`.
