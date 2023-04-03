# shellcheck shell=bash
if [ -f /usr/lib/bats-support/load.bash ]; then
	load /usr/lib/bats-support/load.bash
elif [ -f /run/current-system/sw/lib/bats-support/load.bash ]; then
	load /run/current-system/sw/lib/bats-support/load.bash
else
	echo "please install bats-support firstly!"
	exit 1
fi
if [ -f /usr/lib/bats-assert/load.bash ]; then
	load /usr/lib/bats-assert/load.bash
elif [ -f /run/current-system/sw/lib/bats-assert/load.bash ]; then
	load /run/current-system/sw/lib/bats-assert/load.bash
else
	echo "please install bats-assert firstly!"
	exit 1
fi
if [ ! -f configure ]; then
	autoreconf -vif
fi
