#!/usr/bin/env -S docker build -tfreedwu/my-dotfiles:main . -f
# docker run --rm -it --name=test --gpus=all -p 8022:22 freedwu/my-dotfiles:main
FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04
# bithuab's debug mode uses gtx1080ti

LABEL org.opencontainers.image.title=my-dotfiles
LABEL org.opencontainers.image.authors="Wu Zhenyu"
LABEL org.opencontainers.image.vendor="Wu Zhenyu"
LABEL org.opencontainers.image.url=https://ghcr.io/freed-wu/my-dotfiles
# https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#labelling-container-images
LABEL org.opencontainers.image.source=https://github.com/Freed-Wu/my-dotfiles
LABEL org.opencontainers.image.description=":gear: My dotfiles. "
LABEL org.opencontainers.image.licenses=GPL-3.0

EXPOSE 22
# cannot use `sudo systemctl enable --now ssh`
CMD ["/usr/sbin/sshd", "-D"]

ARG user=wzy
ARG home=/home/$user
ARG mirror=mirrors.ustc.edu.cn

# https://unix.stackexchange.com/questions/56765/creating-a-user-without-a-password/472968
# https://stackoverflow.com/questions/58292862/how-to-install-homebrew-on-ubuntu-inside-docker-container
# codestats need curl
# `pip install -e '.[dev]'` need a higher version of pip
# setuptools_scm need git in $PATH
RUN sed -i s/archive.ubuntu.com/$mirror/g /etc/apt/sources.list && \
      apt-get -y update && \
      ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
      apt-get -y install openssh-server sudo tzdata locales zsh rsync \
      curl python-is-python3 python3-pip python3-build && \
      sed -i 's/^# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen && \
      locale-gen && \
      ln -sf /usr/bin/pip3 /usr/bin/pip && \
      pip install -U pip && \
      sed -i 's/^#PermitRootLogin .*/PermitRootLogin yes/' \
      /etc/ssh/sshd_config && \
      sed -i 's/^#PermitEmptyPasswords .*/PermitEmptyPasswords yes/' \
      /etc/ssh/sshd_config && \
      ssh-keygen -A && \
      mkdir -p /run/sshd && \
      useradd -ms/bin/zsh -k/dev/null -d$home -g65534 $user && \
      echo $user:U6aMy0wojraho | chpasswd -e && \
      echo root:U6aMy0wojraho | chpasswd -e && \
      gpasswd -a$user sudo && \
      echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
      rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /var/tmp/*

USER $user
WORKDIR $home

# cost long time
RUN sh -c "$(curl -fsSL https://mirrors.bfsu.edu.cn/nix/latest/install)"

ARG bin=$home/.nix-profile/bin

# python packages installed by nix-env cannot find systemside packages
RUN mkdir -p .config/nix && \
      echo 'substituters = https://mirrors.bfsu.edu.cn/nix-channels/store https://cache.nixos.org/' > .config/nix/nix.conf && \
      $bin/nix-env -i git neovim tmux vivid exa bat ripgrep fd delta fzf jq \
      nodejs lesspipe file less powerlevel10k && \
      sudo ln -s $bin/nvim /usr/bin/vi

COPY --chown=$user . .
# https://github.com/neoclide/coc.nvim/issues/118#issuecomment-1311768351
RUN export PATH=$bin:$PATH && \
      git config --global safe.directory '*' && \
      git -C ~ reset --hard && \
      TERM=xterm-256color TMUX='' zsh -isc '@zinit-scheduler burst' && \
      ~/.config/tmux/plugins/tpm/bin/install_plugins && \
      vi -c'call dein#update() | quit' && \
      mkdir -p ~/.config/coc/extensions && \
      echo '{"dependencies": {}}' >~/.config/coc/extensions/package.json && \
      npm install -C ~/.config/coc/extensions \
      $(vi --headless -c'echo g:coc_global_extensions | quit' 2>&1 | \
      tail -n1 | sed "s=\(', '\|\['\|']\)=\n=g") && \
      mkdir -p ~/.config/coc/extensions/coc-gist-data && \
      echo '{"token": "gho_"}' \
      >~/.config/coc/extensions/coc-gist-data/secret.json && \
      rm -rf ~/.cache

USER root
WORKDIR /

RUN export PATH=$bin:$PATH && \
      install -D $home/.config/pip/pip.conf -t /root/.config/pip && \
      pip install -e $home'[dev]' && \
      $home/.config/tmux/plugins/tmux-bitahub/requirements.txt
