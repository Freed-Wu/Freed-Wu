#if 0
g++ "$0" -oa && exec ./a "$@"
#endif
#include <iostream>
#include <cstdlib>
int main(int argc, char *argv[]) {
  {% here %}
  return EXIT_SUCCESS;
}
