[global _start]
[section .text]
_start:
  push ebp
  mov ebp, esp

  {% here %}

  mov eax, 1
  mov ebx, 0
  int 0x80

  leave
  ret
