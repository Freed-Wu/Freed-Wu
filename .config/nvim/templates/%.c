#if 0
gcc "$0" -oa && exec a "$@"
#endif
#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
  {% here %}
  return EXIT_SUCCESS;
}
