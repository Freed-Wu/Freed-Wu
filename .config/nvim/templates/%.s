#!/usr/bin/env -S sh -c 'bin="$(basename "$0")" && bin="${bin%%.*}" && as "$0" -o"$bin.o" && ld "$bin.o" -o"$bin" && exec ./"$bin" "$@"'
  .section .data
  .section .text
  .globl _start
_start:
  movl $1, %eax
  movl $0, %ebx
  int $0x80
