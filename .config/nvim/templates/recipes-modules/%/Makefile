# https://stackoverflow.com/a/73509979/16027269
SRC := $(patsubst %/,%,$(dir $(realpath $(lastword $(MAKEFILE_LIST)))))
ifneq ($(KERNELRELEASE),)
	ccflags-y += -g -DDEBUG
	DRIVER_NAME := $(notdir $(SRC))
	$(DRIVER_NAME)-objs := {{ join(uniq(map(filter(glob(expand('%:h') . '/*.c', v:true, v:true), {_, v -> v !~ '.*\.mod\.c'}), {_, v -> fnamemodify(v, ':t:r') . '.o'}))) }}
	obj-m := $(DRIVER_NAME).o
else
# https://docs.yoctoproject.org/1.9/ref-manual/ref-manual.html#var-KERNEL_SRC
ifeq ($(KERNEL_SRC),)
ifneq ($(wildcard /usr/src/linux),)
	KERNEL_SRC := /usr/src/linux
else
	KERNEL_SRC := /lib/modules/$(shell uname -r)/build
# https://nixos.wiki/wiki/Linux_kernel#Developing_out-of-tree_kernel_modules
# nix-env -iA nixos.linuxPackages_latest.kernel.dev
ifneq ($(wildcard /run/current-system/nixos-version),)
	KERNEL_SRC := $(shell nix eval --impure --expr '"$${(import <nixpkgs> {}).linuxPackages_latest.kernel.dev}"')$(KERNEL_SRC)
endif
endif
endif
ifeq ($(wildcard $(KERNEL_SRC)/source),)
	KERNEL_REAL_SRC := $(KERNEL_SRC)
else
	KERNEL_REAL_SRC := $(KERNEL_SRC)/source
endif
KERNEL_MAKE := $(MAKE) -C$(KERNEL_SRC) M=$(SRC)
RULES := all modules modules_prepare modules_check modules_install clean
.PHONY: default $(RULES)
default:
	$(KERNEL_MAKE) && $(MAKE) $(SRC)/compile_commands.json
$(RULES):
	$(KERNEL_MAKE) $@ && $(MAKE) $(SRC)/compile_commands.json
$(SRC)/compile_commands.json: $(wildcard $(SRC)/*.a) $(SRC)/modules.order
	$(KERNEL_REAL_SRC)/scripts/clang-tools/gen_compile_commands.py -d$(KERNEL_SRC) -o$(SRC)/compile_commands.json $(SRC)
endif
