#if 0
bin="$(basename "$0")" && bin="${bin%%.*}" && c++ -g -Wall -o"$bin" "$0" && exec ./"$bin" "$@" || exit $?
#endif
#include <cerrno>
#include <cstdlib>
#include <err.h>
#include <iostream>
int main(int argc, char *argv[]) {
  std::ios::sync_with_stdio(false);
  {% here %}
  return EXIT_SUCCESS;
}
