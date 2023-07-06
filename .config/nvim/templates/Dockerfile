#!/usr/bin/env -S docker build -t{{ g:snips_dockerhub_user }}/{{ expand('%:p:h:t') }}:main . -f
FROM freedwu/my-dotfiles:main

LABEL org.opencontainers.image.title={{ expand('%:p:h:t') }}
LABEL org.opencontainers.image.authors="{{ g:snips_author }}"
LABEL org.opencontainers.image.vendor="{{ g:snips_author }}"
LABEL org.opencontainers.image.url=https://ghcr.io/{{ split(g:snips_github, '/')[-1] }}/{{ expand('%:p:h:t') }}
# https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#labelling-container-images
LABEL org.opencontainers.image.source={{ g:snips_github }}/{{ expand('%:p:h:t') }}
LABEL org.opencontainers.image.description="{% here %}"
LABEL org.opencontainers.image.licenses=GPL-3.0

RUN \
      rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /var/tmp/* && \
      rm -rf ~/.cache
