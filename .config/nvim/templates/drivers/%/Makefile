DRIVER_NAME := $(shell basename $(PWD))
ifneq ($(KERNELRELEASE),)
	ccflags-y += -g -DDEBUG
	obj-m := $(DRIVER_NAME).o
	$(DRIVER_NAME)-objs = {{ join(map(split(glob(expand('%:h') . '/*.c')), {_, v -> fnamemodify(v, ':t:r') . '.o'}), ' ') }}
else
ifeq ($(shell test -d /usr/src/linux || echo 0),)
	KDIR = /usr/src/linux
else
	# https://nixos.wiki/wiki/Linux_kernel#Developing_out-of-tree_kernel_modules
	KDIR = $(shell ./main.nix | jq -r .)/lib/modules/$(shell uname -r)/build
endif
.PHONY: all modules clean install uninstall distclean
all: modules
modules:
	$(MAKE) -C$(KDIR) M=$(PWD) modules
clean:
	$(MAKE) -C$(KDIR) M=$(PWD) clean
install: $(DRIVER_NAME).ko
	insmod $(DRIVER_NAME).ko
	MAJOR=$(shell grep -w $(DRIVER_NAME) /proc/devices | cut -d' ' -f1)
	test -z $$MAJOR || mknod /dev/$(DRIVER_NAME) c $$MAJOR 0
uninstall:
	$(RM) /dev/$(DRIVER_NAME)
	rmmod $(DRIVER_NAME)
distclean: clean install
endif
