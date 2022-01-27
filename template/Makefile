srcdir = .
builddir = build
prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
INCLUDE = -I$(srcdir)
CC_O = -o$@
CC = gcc -c
CFLAGS = -g -std=gnu99
DEPMM = -MM -g0
LD = gcc
LDFLAGS =
RM = rm -rf
MKDIR = mkdir -p
INSTALL = install
-include config.mak
-include .depend
vpath %.c $(srcdir)
vpath %.h $(srcdir)

.PHONY: default
default: all
.PHONY: all
all: $(builddir)/main
$(builddir)/main: $(builddir)/main.o
	$(MKDIR) $(builddir)
	$(LD) $(LDFLAGS) $(INCLUDE) $(CC_O) $<
$(builddir)/%.o: %.c
	$(MKDIR) $(builddir)
	$(CC) $(CFLAGS) $(INCLUDE) $(CC_O) $^

.PHONY: depend
depend: .depend
.depend:
	$(CC) $(CFLAGS) $(DEPMM) $(srcdir)/*.c > .depend

.PHONY: clean
clean:
	$(RM) $(builddir)/*.o
.PHONY: distclean
distclean: clean
	$(RM) $(builddir)/main

.PHONY: install
install:
	$(INSTALL) $(builddir)/main $(bindir)
.PHONY: uninstall
uninstall:
	$(RM) $(bindir)/main
