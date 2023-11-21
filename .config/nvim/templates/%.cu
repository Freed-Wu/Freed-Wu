#if 0
bin="$(basename "$0")" && bin="${bin%%.*}" && nvcc "$0" -o "$bin" && exec ./"$bin" "$@"
#endif
#include <err.h>
#include <cerrno>
#include <cstdio>
#include <cstdlib>
int main(int argc, char *argv[]) {
  {% here %}
  return EXIT_SUCCESS;
}
