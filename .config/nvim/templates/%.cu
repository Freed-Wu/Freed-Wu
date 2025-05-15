#if 0
bin="$(basename "$0")" && bin="${bin%%.*}" && nvcc -g -G -Xcompiler -Wall -o "$bin" "$0" && exec ./"$bin" "$@" || exit $?
#endif
#include <err.h>
#include <cerrno>
#include <cstdio>
#include <cstdlib>

__global__ void kernel() {
  {% here %}
}

int main(int argc, char *argv[]) {
  kernel<<<1, 1>>>();
  cudaDeviceSynchronize();
  return EXIT_SUCCESS;
}
