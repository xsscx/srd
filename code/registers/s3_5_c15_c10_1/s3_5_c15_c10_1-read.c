#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
     uint64_t val;
     if (argc > 1) {
         val = atoi(argv[1]);
         asm("msr s3_5_c15_c10_1, %x0" : : "r"(val));
     } else {
         asm("mrs %x0, s3_5_c15_c10_1" : "=r"(val));
         printf("%llu\n", val);
     }
     return 0;
}
