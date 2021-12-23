#! /usr/bin/env bash
#? v0.0.1
##? usage: msys-setup.sh [options]
##?
##? options:
##?   -h, --help            Show this screen.
##?   -V, --version         Show version.
help=$(grep "^##?" "$0" | cut -c 5-)
version=$(grep "^#?" "$0" | cut -c 4-)
eval "$(docopts -h "$help" -V "$version" : "$@")"
sed -i 's=db_home: .*=db_home: /proc/cygdrive/c/Users/%U=' /etc/nsswitch.conf
sed -i 's=none / =none /mnt =' /etc/fstab
if [[ $OSTYPE == msys ]] && grep bfsu /etc/pacman.d/mirrorlist.mingw32; then
  sed -i '1aServer = https://mirrors.bfsu.edu.cn/msys2/mingw/i686' /etc/pacman.d/mirrorlist.mingw32
  sed -i '1aServer = https://mirrors.bfsu.edu.cn/msys2/mingw/x86_64' /etc/pacman.d/mirrorlist.mingw64
  sed -i '1aServer = https://mirrors.bfsu.edu.cn/msys2/mingw/ucrt64' /etc/pacman.d/mirrorlist.ucrt64
  sed -i '1aServer = https://mirrors.bfsu.edu.cn/msys2/mingw/clang64' /etc/pacman.d/mirrorlist.clang64
  sed -i "1aServer = https://mirrors.bfsu.edu.cn/msys2/msys/\$arch" /etc/pacman.d/mirrorlist.msys
  pacman -Sy
fi
