# file: /data/.profile
export PREFIX=/data/data/com.termux/files/usr
export HOME=/data/data/com.termux/files/home
export TMPDIR="$PREFIX/tmp"
export LD_LIBRARY_PATH="$PREFIX/lib"
export LD_PRELOAD=libtermux-exec.so
export PATH="$PREFIX/bin:$PATH"
export LANG=en_US.UTF-8
export SHELL="$PREFIX/bin/zsh"
cd && exec "$SHELL" -l
