#!/usr/bin/env -S sh -c 'bin="$(basename "$0")" && bin="${bin%%.*}" && as "$0" -o"$bin.o" && ld "$bin.o" -o"$bin" && exec ./"$bin" "$@"'
.intel_syntax noprefix
.section .text
.globl _start
_start:
  push ebp
  mov ebp, esp

  {% here %}

  mov eax, 1
  mov ebx, 0
  int 0x80

  leave
  ret
