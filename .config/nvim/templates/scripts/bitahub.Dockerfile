#!/usr/bin/env -S docker build -tfreedwu/{{ expand('%:p:h:t') }}:main . -f
# {{ g:snips_github }}/{{ split(g:snips_github, '/')[-1] }}/wiki/Bitahub-docker-build
# ssh bitahub -p XXXXX
# sudo chown -R {{ $USER }}:nogroup /code /output
FROM freedwu/{{ expand('%:p:h:t') }}:main
