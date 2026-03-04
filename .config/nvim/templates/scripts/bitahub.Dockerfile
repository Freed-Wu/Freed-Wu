#!/usr/bin/env -S docker build -tfreedwu/{{ expand('%:p:h:t') }}:main . -f
# https://github.com/Freed-Wu/Freed-Wu/wiki/Bitahub-docker-build
# ssh bitahub -p XXXXX
# sudo chown -R wzy:nogroup /code /output
FROM freedwu/{{ expand('%:p:h:t') }}:main
