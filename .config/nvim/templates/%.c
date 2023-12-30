#if 0
bin="$(basename "$0")" && bin="${bin%%.*}" && cc -g -Wall -o"$bin" "$0" && exec ./"$bin" "$@"
#endif
#include <err.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
  {% here %}
  return EXIT_SUCCESS;
}
