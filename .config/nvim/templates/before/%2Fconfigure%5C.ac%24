#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.71])
m4_define([VERSION],
          m4_esyscmd([build-aux/git-version-gen .tarball-version])
          )
AC_INIT([{{ expand('%:p:h:t') }}],
        m4_defn([VERSION]),
        [{{ g:snips_github }}/{{ expand('%:p:h:t') }}/issues],
        [{{ expand('%:p:h:t') }}-]m4_defn([VERSION]),
        [{{ g:snips_github }}/{{ expand('%:p:h:t') }}]
        )
AC_CONFIG_SRCDIR([src/main.c])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE([subdir-objects -Wall -Werror foreign])
AH_TOP([#ifndef CONFIG_H])
AH_TOP([#define CONFIG_H 1])
AH_BOTTOM([#endif])

# Checks for programs.
AC_PROG_CC([gcc clang])

# Checks for libraries.
PKG_CHECK_MODULES([CHECK], [check >= 0.9.6])

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile tests/Makefile])
AC_OUTPUT
