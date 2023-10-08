#if 0
bin="$(basename "$0")" && bin="${bin%%.*}" && g++ "$0" -o"$bin" && exec ./"$bin" "$@"
#endif
#include <cerrno>
#include <cstdio>
#include <cstdlib>
int main(int argc, char *argv[]) {
  {% here %}
  return EXIT_SUCCESS;
}
