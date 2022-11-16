#!/usr/bin/env -S docker build -tfreedwu/%DIR%:main . -f
# ssh -pXXXXX bitahub
# sudo chown -R wzy:nogroup /code /output
FROM freedwu/my-dotfiles:main

RUN pip install \
.!perl -pe's/\#.*//g;s/\n/ /g' requirements.txt requirements/*.txt | perl -0pe's/ +/ /g;s/ $//g;s/^ */      /g'
# .!perl -pe's/\#.*//g;s/\n/ /g' requirements.txt requirements/*.txt | perl -0pe's/ +/ /g;s/ $//g;s/^ */      /g'
