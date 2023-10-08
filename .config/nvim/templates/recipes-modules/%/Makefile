# https://stackoverflow.com/a/73509979/16027269
SRC := $(patsubst %/,%,$(dir $(realpath $(lastword $(MAKEFILE_LIST)))))
ifneq ($(KERNELRELEASE),)
	DRIVER_NAME := $(notdir $(SRC))
	ccflags-y += -g -DDEBUG
	obj-m := $(DRIVER_NAME).o
	$(DRIVER_NAME)-objs := {{ join(uniq(map(split(glob(expand('%:h') . '/*.c')), {_, v -> fnamemodify(v, ':t:r:r') . '.o'}))) }}
else
# https://docs.yoctoproject.org/1.9/ref-manual/ref-manual.html#var-KERNEL_SRC
ifeq ($(KERNEL_SRC),)
ifeq ($(shell test -d /usr/src/linux || echo 0),)
	KERNEL_SRC := /usr/src/linux
else
	KERNEL_SRC := /lib/modules/$(shell uname -r)/build
# https://nixos.wiki/wiki/Linux_kernel#Developing_out-of-tree_kernel_modules
ifeq ($(shell test -f /run/current-system/nixos-version || echo 0),)
	KERNEL_SRC := $(shell nix eval --impure --expr '"$${(import <nixpkgs> {}).linuxPackages_latest.kernel.dev}"')$(KERNEL_SRC)
endif
endif
endif
KERNEL_MAKE := $(MAKE) -C$(KERNEL_SRC) M=$(SRC)
RULES := all modules modules_prepare modules_check modules_install clean
.PHONY: default $(RULES) install uninstall reinstall
default:
	$(KERNEL_MAKE)
$(RULES):
	$(KERNEL_MAKE) $@
endif
