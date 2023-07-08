# my-dotfiles

[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/Freed-Wu/my-dotfiles/main.svg)](https://results.pre-commit.ci/latest/github/Freed-Wu/my-dotfiles/main)
[![github/workflow](https://github.com/Freed-Wu/my-dotfiles/actions/workflows/main.yml/badge.svg)](https://github.com/Freed-Wu/my-dotfiles/actions)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FFreed-Wu%2Fmy-dotfiles.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2FFreed-Wu%2Fmy-dotfiles?ref=badge_shield)

[![github/downloads](https://shields.io/github/downloads/Freed-Wu/my-dotfiles/total)](https://github.com/Freed-Wu/my-dotfiles/releases)
[![github/downloads/latest](https://shields.io/github/downloads/Freed-Wu/my-dotfiles/latest/total)](https://github.com/Freed-Wu/my-dotfiles/releases/latest)
[![github/issues](https://shields.io/github/issues/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles/issues)
[![github/issues-closed](https://shields.io/github/issues-closed/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles/issues?q=is%3Aissue+is%3Aclosed)
[![github/issues-pr](https://shields.io/github/issues-pr/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles/pulls)
[![github/issues-pr-closed](https://shields.io/github/issues-pr-closed/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles/pulls?q=is%3Apr+is%3Aclosed)
[![github/discussions](https://shields.io/github/discussions/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles/discussions)
[![github/milestones](https://shields.io/github/milestones/all/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles/milestones)
[![github/forks](https://shields.io/github/forks/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles/network/members)
[![github/stars](https://shields.io/github/stars/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles/stargazers)
[![github/watchers](https://shields.io/github/watchers/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles/watchers)
[![github/contributors](https://shields.io/github/contributors/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles/graphs/contributors)
[![github/commit-activity](https://shields.io/github/commit-activity/w/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles/graphs/commit-activity)
[![github/last-commit](https://shields.io/github/last-commit/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles/commits)
[![github/release-date](https://shields.io/github/release-date/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles/releases/latest)

[![github/license](https://shields.io/github/license/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles/blob/main/LICENSE)
[![github/languages](https://shields.io/github/languages/count/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles)
[![github/languages/top](https://shields.io/github/languages/top/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles)
[![github/directory-file-count](https://shields.io/github/directory-file-count/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles)
[![github/code-size](https://shields.io/github/languages/code-size/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles)
[![github/repo-size](https://shields.io/github/repo-size/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles)
[![github/v](https://shields.io/github/v/release/Freed-Wu/my-dotfiles)](https://github.com/Freed-Wu/my-dotfiles)

[![docker/pulls](https://img.shields.io/docker/pulls/freedwu/my-dotfiles)](https://hub.docker.com/r/freedwu/my-dotfiles)
[![docker/image-size](https://img.shields.io/docker/image-size/freedwu/my-dotfiles)](https://hub.docker.com/r/freedwu/my-dotfiles)
[![docker/stars](https://img.shields.io/docker/stars/freedwu/my-dotfiles)](https://hub.docker.com/r/freedwu/my-dotfiles)
[![docker/v](https://img.shields.io/docker/v/freedwu/my-dotfiles)](https://hub.docker.com/r/freedwu/my-dotfiles/tags)

My [dotfiles](https://dotfiles.github.io). Install
[github-cli](https://cli.github.com) then use the following code to `ssh`
a codespace with this dotfiles:

```bash
gh cs create -RFreed-Wu/my-dotfiles -mbasicLinux32gb -dwzy
# wait about 3 minutes
gh cs ssh
```

This project contains:

- [all scripts](script) to create this codespace. Refer
  [personalizing-github-codespaces-for-your-account](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-github-codespaces-for-your-account#dotfiles).
- [the configuration](.zshrc) for my shell
  [![zsh](https://img.shields.io/badge/zsh-gray?logo=data:image/png%3Bbase64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAADg0lEQVR4Ae2YA7A0ORCA+2zbdzPJ49m27QvOtm3bVzjbtm1bv21sJs/cv7sqtZNFPVbN7quar6oXSfZ196S703mQkpKSkpKSUkD2kFUXMprtmj1xo/kgaYwINraS3Rjp8NlI8scjFZ7ecES4PPQRMtoq9kmkWDZS/HJIilmaLY6KXybFJaQh0uw06ANW8Qfcb7qtZPsks+VHr7kgKvyOFPckVvILoAdwzTm59ZpdAwlBiq8qYfB4lNkFYx1WVtWU/Bsy3B3nO2kd7WQWYK6EEg7mQaXTPSNnWxlsDTS3/fbz0pMscOI+KKBBszocN27+l8knrrwwJINT7oeJDs+DAsgob81v4IE7siyOjXRzkzCXVoUkQYO3yn/CwZ5FDmj2lLdmXLx79fMbxT6ncXxvjnSwCSSNOaJ6Ld8BI9nt4JHdgy0QqXCMt+Y7QCjG8fOTbqwbf3colAs0YJifqBRGjXKtFRoO47X4/c2CHLgKECPDy3JOK3YRlBM0+CjfyB4kQzGfUfxA/Nzlxp6ASsAo9mgvxrdRfmQE2wA/N7qxrynEoOy4mKbQicthLFbxP6xkWzQdXruSOx+ylBeuxagsph6x7iL2cLYvnapGsVMiVbUpOUcNGo794JyyjTpYB4YIruLw55zxnVbzvWEoEWl+fS6kZHgGOWQkP8go9po7xMahvG81O9a10JUD1Xeq865cPpw5es0l8fOHPST7b7OPDFaHSsCKcEs0qMUZ/znlQdzr9yCa/Tvj2OrFoJxk1FproDFTXcX536jVlypxXrS5MHoexebPhddCuaCnR6XTGTML6z93Z8Xn3unbTLe3nMOiZs1Isylx6WUTXEudLNmrYe5IsjecIe1Ghjt6LUfkPeHHwMdvL5wkfk44I++MGzt+UsFcq2fgnUW/lexU34HEk9lKfkyJrtR34B9vB8bEieouRpp94znQmGhJtYdXbUNJ6ZS/SwYVOxBel39HZr/j2JFUaq1in/pzdPAl2MhVBah0hlP+z+xDgiWgBNEh9UvHlalHabKHV1dDElB5pDLpFE+l8tljjgi+Ga6bWdJwV52sDPfv/XRn79H6QcgI+lcQWM1ucgMt1HFCH6DkxPVPk7H+RSjS4dt9bfJw/dhBOtDaJKpXBiP5LlTzqbcZSOeaObxqPaPCjajFgH5AFyOjg50wfHceiNBVGAZHSkpKSkpKSsoczV+akNhbXS4AAAAASUVORK5CYII=)](https://zsh.sourceforge.io).
- [the configuration](.config/tmux) for my terminal multiplexer
  [![tmux](https://img.shields.io/badge/tmux-gray?logo=tmux)](https://github.com/tmux/tmux/wiki).
- [the configuration](.config/wezterm) for my PC terminal emulator
  [![wezterm](https://img.shields.io/badge/wezterm-gray?logo=data:image/jpg%3Bbase64,/9j/4AAQSkZJRgABAQIBLAEsAAD/2wBDACAWGBwYFCAcGhwkIiAmMFA0MCwsMGJGSjpQdGZ6eHJmcG6AkLicgIiuim5woNqirr7EztDOfJri8uDI8LjKzsb/2wBDASIkJDAqMF40NF7GhHCExsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsbGxsb/wAARCACAAIADASIAAhEBAxEB/8QAGQABAAMBAQAAAAAAAAAAAAAAAAEDBAIF/8QAKBAAAwACAAUDBAMBAAAAAAAAAAECAxEhMVFhcQQSQSIjMjMTQoGR/8QAGAEBAQEBAQAAAAAAAAAAAAAAAAEEAgP/xAAeEQEBAQADAQEAAwAAAAAAAAAAAQIDERIxISIyQf/aAAwDAQACEQMRAD8A8CZdPSNMYpnu+rGOPZPf5OyoAAIAAAAAAAAAAAAAK7xTXLg+pnqXL0zYcZI989/gK6AAQAAAAtnEnKbb4nWc3XwVA6ySprSZySzq9UAAQAAAAAAAAAQAqQTE++tI0zClcEeuOO7RnWO3/VmlLSSIdynptEtpLbejRjGcd9UUXFu29FbTT0+ZqVJ8mjNke7ryePLiT9g6xSrppndYpUt8TjB+f+F9fi/B3x5zcd2DKCAZVdSt0l1Lv4Z7lOP9k+TUaeHMsvcRkrhTQFfk/JBnv1UAAgu9O/qfgv8AgxptPa5mnHkV9mauHc681FKhrKk+pZ6h6hLqy0qzzVaa4pFuPGL0KCADIqzB+xGl8jLh/YjUa+D+qMfN6LKwuZb3vRGJbyrsaWtpo8+PjmpbRlxfsk1GbEtZUuhpr8X4PTg/M0Y3zIAMigAAAADThp1G29liafJnGL6cS8bKMdUsi18vibPfmZl/1F2TEq4rgzMbTLm4ZXo45sSfygjG/uT5NZjl6peTYXg+UqnCvrp/4WRfuql0ZEr2TTfVspwV9zj8ll8eYO9a9R54lt8IrwQ5+5NEZXrFR3J5lGUAGFUAADR6dcKZa4l85X/DJOSpWpei3Dku703w0aePeepnpF+lrXwQpmeSSIyV7cba5mV5LfOmem+SYvwabyzC6voZW3TbfNkAzb5LtUm1cjCaJzypSezvh1J32ldZ3rG+5ml6pPoWZsivWt6RUc8uu9dwbuZXnf235OYzyoSe9o5zZZuUlvme+uTNx9FIAMagIAElmLIse9pvZUC5tze4LsuZXGkmiogF1q6vdEggHIkEACQQAJBAAkEADmK9y7nRQm09otm0/IHQAAAAAAAAAAAAAAABzde1dxVpd30Km23tgf/Z)](https://wezfurlong.org/wezterm).
- [the configuration](.termux) for my Android terminal emulator
  [![termux](https://img.shields.io/badge/termux-gray?logo=data:image/jpg%3Bbase64,/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAGRFS1hLP2RYUVhxamR3lvqjloqKlv/b57X6////////////////////////////////////////////////////2wBDAWpxcZaDlv+jo///////////////////////////////////////////////////////////////////////////wAARCADIAMgDASIAAhEBAxEB/8QAGQABAAMBAQAAAAAAAAAAAAAAAAIDBAUB/8QALhABAAIBAQcDAQgDAAAAAAAAAAECAxEEEyExMlKREhRBYSIjM0NigaHRUXGx/8QAFAEBAAAAAAAAAAAAAAAAAAAAAP/EABQRAQAAAAAAAAAAAAAAAAAAAAD/2gAMAwEAAhEDEQA/AMoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC/Hs28pFovHH6KFuz5pxW49M8wWeznvjwqzYbYtNZ1ifl0I4xrDy9IvWa25SDmCWSk47zWUQAAAAAAAAAAAAAAAAAAAAAAatlzfl2/b+mpy2/Z8u8ppPVHMHufFGWn6o5OfMaTpPN1GbasOv3lefyDIAAAAAAAAAAAAAAAAAAAAAAlS80vFq84RAdLHeMlItHykwYM26tx6Z5t8cY1gGHaMO7trHTP8ACl071i9ZrblLnZMc47zWQRAAAAAAAAAAAAAAAAAAAAAAbtk9W6+1y+GbBh3tuPTHNvjhGkAM+2ej0Rr1fC+9opWbW5Q52TJOS82kEQAAAAAAAAAAAAAAAAAAAEqUm94rXnKLfs+Ld01nqnmCeOkY6RWPhIZtqzafd15/IKtozby2kdMfypAAAAAAAAAAAAAAAAAAAAFuz4Zy249McwW7Lh/Mt+39tRHCNIeXvFKza3KAQz5YxU/VPJz5nWdZ5pZLzkvNpRAAASil7RrFLTH0hFv2b8Cv7/8AZBi3WTst4k3WTst4l0gHN3WTst4k3WTst4l0gHN3WTst4knHeI1mlvDpI3/Dt/qQc0AAAAAAAAABfj2nd0isUjh9VADT7yeyPKrNmtl01jSI+FYAAAAAvx7TOOkV9MTp9VADT7yeyPJ7yeyPLMA0+8nsjye8nsjyzANPvJ7I8vLbXM1mPRHGP8s4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//Z)](https://termux.dev).
- [the configuration](.config/nvim) for my editor
  [![neovim](https://img.shields.io/badge/neovim-gray?logo=neovim)](https://neovim.io).
- [the configuration](.config/neomutt) for my mail reader
  [![neomutt](https://img.shields.io/badge/neomutt-gray?logo=data:image/jpg%3Bbase64,/9j/4AAQSkZJRgABAQIAIwAjAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAAwADADASIAAhEBAxEB/8QAGwAAAgIDAQAAAAAAAAAAAAAABQcEBgABCAP/xAAvEAABAwMEAAUBCAMAAAAAAAABAgMEAAURBhIhMQcTMlFhQRQiIyQzcZGxodHh/8QAFgEBAQEAAAAAAAAAAAAAAAAAAAME/8QAIBEAAgIBAwUAAAAAAAAAAAAAAAECAxESQaEhMWGi0f/aAAwDAQACEQMRAD8A5/rKn2W2qu93jwUnb5quT7AcmoslCW5TzaQQlKykA/BoDyo5pjTrmoZzjfm+THZTvddxnA6AHyaBgEkADJNPzw70ci32H86CZMopccGfSB6U0Aj7oxHj3WRHib1MtuFCCvknHGah9U0NY2y26Q+2TbW83IlypKm8qAJj/Ugf7pYElSiSck8k0AU03cBa9RQpavQhwBf7Hg/3RXXmn3LNf3Hm0ExJZ81pYHHPYobpW3oump4ERz9NboKvkDnH+K6XYYjutpQ8y24gdJWkED+aA5503Ynylu8SoLxhsvJIWU4Ss+1Pa03Fp+Mh5lYUhQyDRic1GkQlxVtILCk7SjHGKVspyToq4K3FTtsdVwc9f9/upNuMsvs+DbXCu+rTHpNey+rleSz3mFZWpsOdLtbD0duQp57DefvEeo+4zjNKbxFuVnud3betTDDR2kOeSkBJ9uvrR29+JcRyA6zb0PKeWkpC1pwE5+tK8kkkns1qjYlW4aVl7kY3KNUq9Ky990GNLRLhM1FDRbDtkpXvCz0gDsn4p23nWMTTcmDGlvIKnD+MQCShOO8D3NK7w3vNus15kuXB5LKXGdqHFDgHPVXGfd9DBifKDkSTKdQpR3grUpWOAM9VIgH4OvrTerq3bretx5xaVKKyjalIA+aUmsdQ3S9XR+JJwGYrqkpbbTxwcZNSNJ3m223VkaW84GY6I5Qte08qxV6c1Zo6PFmGM8x5ryVqVtaOVqIPZxQCUrK2o5UT1k1qgP/Z)](https://neomutt.org).
- [the configuration](.config/ptpython) for my python REPL
  [![ptpython](https://img.shields.io/badge/ptpython-gray?logo=python)](https://github.com/prompt-toolkit/ptpython).
- [the configuration](.config/visidata) for my data analysis tool
  [![visidata](https://img.shields.io/badge/visidata-gray?logo=data:image/ico%3Bbase64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAAACXBIWXMAAFxGAABcRgEUlENBAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAALVSURBVHja7FXPSypRFD6TY+gijMdQSCb5cFXLiiRaqBuFapWLaCOGuPEvaFF/QrWI3NjSRWIQVIQbIYgQ3FeGCMakiS7G3xrj3Lc4dJnGKYV+8B68b3X87uUezznffIfJZDKxWAw+jdXV1enpaZWD8/Nz+ApEIhGihiH4ZvxP0BfsF77V6XS2trbeTWA2mxcWFgDg5OREkiTKu93ubrdbrVZfXl6Ght5U3Gg07u/v6c9KpbK3t/euTFdWVlBYRqORnq6trSEZj8e73W6vCnd2dqhMi8XiRzMoFAq0FAw4jjs8PAQAnucvLy8Vfx+xsbEx6JB5nsfAZDJhEAqFxsbGCCF+v39xcREAJEmy2+1zc3Pr6+t4hxAy6JBLpZIoiizLYgUej8fj8QBAOBxOJBLHx8cAkEqlrq6u5O+mUinFi1arVavVYnx3d/fGKnieJ4Ts7u5yHFcsFgkh2Wx2ZGTE4XBgx7e3t/Hm0dERMktLS4oZPD4+0gkpZZrP5ycmJsxm88HBATZnc3OzVqstLy/jhYuLCwAIBAI+nw8Azs7Orq+vFRUkk8lsNqtudqenp4SQer2O+ff395G/vb0lhAiC4HK5YrEYngqCMDU1JTc7VRW9SRAKhWh16XRar9ejqHrVWa/XnU6nwk37yFSu1Ha77fV6W60WAND+IJrNZjQanZ+fTyQSqrIZHR399YqB9gHHcb9fYTKZNBrNe/ug/5BVUS6Xy+XyX2F2CiP4B+0aodfrGYahivj6BOl0enJyEmOGYb69RYwgCJlM5vMPWSwWURTHx8dpf9ATWYPBMDs7K7/68PAg31MD4unp6fn5WcXAe23A5XLRDlL0Mkh+zHwk02AwKMlgs9lmZmbkTC6XA4CbmxsFk8vlKPMT3wHTu/Pcbnc8HmdZdnh4mJLtdhsAdDqdvLetVkun09Fdjcyg34EoiqIoKshms6lgMLEc6ME/ZxV/BgBrCwLlOwWsngAAAABJRU5ErkJggg==)](https://www.visidata.org).
- [the configuration](.local/share/fcitx5/rime) for my input method engine
  [![rime](https://img.shields.io/badge/rime:%20microsoft%20double%20pinyin-gray?logo=data:image/png%3Bbase64,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)](https://rime.im).
- [a list](.gitignore) to display all my used programs.

The system side configurations can be found:

- [the configurations](https://github.com/Freed-Wu/nixos) for
  [![NixOS](https://img.shields.io/badge/NixOS-unstable-blue?logo=NixOS)](https://nixos.org).
- [the configurations](https://github.com/Freed-Wu/pacman.d) for
  [![Archlinux](https://img.shields.io/badge/Archlinux-rolling-blue?logo=Archlinux)](https://archlinux.org).
- [the configurations](https://github.com/Freed-Wu/portage) for
  [![Gentoo](https://img.shields.io/badge/Gentoo-rolling-blue?logo=Gentoo)](https://www.gentoo.org).
- [All my configurations](https://github.com/Freed-Wu?tab=repositories&q=dotfiles).

## Nerd font styles

I collect some [nerd font](https://www.nerdfonts.com) style configurations for
many programs:

### [bash](https://github.com/Freed-Wu/my-dotfiles/blob/main/.bashrc)

![bash](https://user-images.githubusercontent.com/32936898/205438946-3ecbd16a-3832-4609-a4b4-84be21fe1165.png)

### [zsh](https://github.com/romkatv/powerlevel10k)

![zsh](https://user-images.githubusercontent.com/32936898/205438934-4add45ea-62bc-477e-93bb-4d615bd7aa3f.png)

### [tclsh](https://github.com/Freed-Wu/my-dotfiles/blob/main/.tclshrc)

![tclsh](https://github.com/Freed-Wu/my-dotfiles/assets/32936898/d410608b-6ddf-4c1b-a72e-9d6f6b1f48a4)

### [wish](https://github.com/Freed-Wu/my-dotfiles/blob/main/.wishrc)

![wish](https://github.com/Freed-Wu/my-dotfiles/assets/32936898/a8a2304b-cc63-4597-befe-9e04fc453179)

### [vivado](https://aur.archlinux.org/packages/vitis)

![vivado](https://github.com/Freed-Wu/my-dotfiles/assets/32936898/37a9488b-8ea5-407d-9d3a-0f15de24abad)

### xsct

![xsct](https://github.com/Freed-Wu/my-dotfiles/assets/32936898/bcec3659-ebdf-4c3b-aefa-193020db4146)

### [python](https://github.com/Freed-Wu/my-dotfiles/tree/main/.config/python/python)

![python](https://user-images.githubusercontent.com/32936898/205494856-6f11d1a1-b2e3-469d-91c7-8a24c400fa78.jpg)

### [octave](https://github.com/Freed-Wu/my-dotfiles/blob/main/.octaverc)

![octave](https://user-images.githubusercontent.com/32936898/205438943-431b16bf-e858-4fd4-80dd-59841f859416.png)

### [reply](https://github.com/Freed-Wu/Reply-Plugin-Prompt/)

![reply](https://user-images.githubusercontent.com/32936898/210608476-34f5cf64-e565-4292-9f3d-d8472db7035b.jpg)

### [luap](https://github.com/dpapavas/luaprompt)

![luap](https://user-images.githubusercontent.com/32936898/229018452-f9cba971-8ae6-4249-a715-bb910259053f.jpg)

### [lftp](https://github.com/Freed-Wu/my-dotfiles/blob/main/.config/lftp/rc)

![lftp](https://user-images.githubusercontent.com/32936898/205438945-7ac66e83-bcd4-4574-a520-614023fa1205.png)

### [gdb](https://github.com/Freed-Wu/my-dotfiles/blob/main/.config/gdb/gdbinit)

![gdb](https://user-images.githubusercontent.com/32936898/228215268-4d480ca9-797e-4d70-9e3e-d9c43dfab80b.jpg)

### [trans](https://github.com/Freed-Wu/translate-shell/)

![trans](https://user-images.githubusercontent.com/32936898/205499028-c2304621-b51b-40b6-a386-54fc94916544.jpg)

### [vim](https://github.com/vim-airline/vim-airline)

![vim](https://user-images.githubusercontent.com/32936898/205438937-349daa37-ba3d-4ebf-a485-7481a5066265.png)

### [tmux](https://github.com/Freed-Wu/my-dotfiles/blob/main/.config/tmux/tmux.conf)

![tmux](https://user-images.githubusercontent.com/32936898/205438941-d0dafaef-798e-448e-8804-2ccf902427d3.png)

See [wiki](https://github.com/Freed-Wu/my-dotfiles/wiki) to know more.

## License

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FFreed-Wu%2Fmy-dotfiles.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2FFreed-Wu%2Fmy-dotfiles?ref=badge_large)

<!-- ex: nowrap
-->
