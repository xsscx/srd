#include <stdio.h>
#include <stdint.h>

int main(int argc, char *argv[])
{
  uint64_t *sprr = (uint64_t *)0xfffffc110;
  printf("%llx %llx\n", sprr[0], sprr[1]);
  uint64_t *sprr118 = (uint64_t *)0xfffffc118;
  printf("%llx %llx\n", sprr118[0], sprr118[1]);
}
