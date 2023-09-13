#!/usr/bin/env -S make -f
ifneq ($(KERNELRELEASE),)
	obj-m := main.o
else
ifeq ($(shell test -d /usr/src/linux || echo 0),)
	KDIR = /usr/src/linux
else
	# https://nixos.wiki/wiki/Linux_kernel#Developing_out-of-tree_kernel_modules
	KDIR = $(shell ./main.nix | jq -r .)/lib/modules/$(shell uname -r)/build
endif
.PHONY: all clean
all:
	$(MAKE) -C$(KDIR) M=$(PWD) modules
clean:
	$(RM) *.ko *.o *.mod *.mod.o *.mod.c *.symvers .*.cmd *.order
endif
