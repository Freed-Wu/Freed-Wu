#if 0
bin="$(basename "$0")" && bin="${bin%%.*}" && cc "$0" -o"$bin" && exec ./"$bin" "$@"
#endif
#include <err.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
  {% here %}
  return EXIT_SUCCESS;
}
