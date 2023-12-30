#if 0
bin="$(basename "$0")" && bin="${bin%%.*}" && c++ -g -Wall -o"$bin" "$0" && exec ./"$bin" "$@"
#endif
#include <err.h>
#include <cerrno>
#include <cstdio>
#include <cstdlib>
int main(int argc, char *argv[]) {
  {% here %}
  return EXIT_SUCCESS;
}
