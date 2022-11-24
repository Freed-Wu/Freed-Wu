#!/usr/bin/env -S docker build -tfreedwu/%DIR%:main . -f
# https://github.com/Freed-Wu/my-dotfiles/wiki/Bitahub-docker-build
# ssh bitahub -p XXXXX
# sudo chown -R wzy:nogroup /code /output
FROM freedwu/%DIR%:main
