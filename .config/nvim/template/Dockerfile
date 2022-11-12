#!/usr/bin/env -S docker build -t%DOCKERHUB_USER%/%DIR%:main . -f
FROM freedwu/my-dotfiles:main

LABEL org.opencontainers.image.title=%DIR%
LABEL org.opencontainers.image.authors="%USER%"
LABEL org.opencontainers.image.vendor="%USER%"
LABEL org.opencontainers.image.url=https://ghcr.io/%GITHUB_USER%/%DIR%
# https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#labelling-container-images
LABEL org.opencontainers.image.source=%GITHUB%/%DIR%
LABEL org.opencontainers.image.description="%HERE%"
LABEL org.opencontainers.image.licenses=GPL-3.0

RUN \
      rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /var/tmp/* && \
      rm -rf ~/.cache
