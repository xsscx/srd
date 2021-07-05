#include <stdio.h>
#include <stdint.h>

int main(int argc, char *argv[])
{
  uint64_t *sprr = (uint64_t *)0xfffffc110;
  printf("%llx %llx\n", sprr[0], sprr[1]);
}
