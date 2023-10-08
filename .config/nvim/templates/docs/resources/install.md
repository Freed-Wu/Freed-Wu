# Install

## [AUR](https://aur.archlinux.org/packages/{{ expand('%:p:h:h:h:t') }})

```sh
yay -S python-{{ expand('%:p:h:h:h:t') }}
```

## [NUR](https://nur.nix-community.org/repos/{{ split(g:snips_github, '/')[-1] }})

```sh
nix-env -iA nixos.nur.repos.{{ split(g:snips_github, '/')[-1] }}.{{ expand('%:p:h:h:h:t') }}
```

## [PYPI](https://pypi.org/project/{{ expand('%:p:h:h:h:t') }})

```sh
pip install {{ expand('%:p:h:h:h:t') }}
```

See [requirements](requirements) to know `extra_requires`.
