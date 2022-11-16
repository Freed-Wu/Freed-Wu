#!/usr/bin/env -S docker build -tfreedwu/bitahub:main . -f
# ssh -pXXXXX bitahub
# sudo chown -R wzy:nogroup /code /output
FROM freedwu/my-dotfiles:main

RUN pip install %HERE%
