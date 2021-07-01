#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>


void write_sprr(uint64_t v)
{
    __asm__ __volatile__("msr S3_0_c5_c6_1, %0\n"
                         "isb sy\n" ::"r"(v)
                         :);
}

uint64_t read_sprr(void)
{
    uint64_t v;
    __asm__ __volatile__("isb sy\n"
                         "mrs %0, S3_0_c5_c6_1\n"
                         : "=r"(v)::"memory");
    return v;
}


int main(int argc, char *argv[])
{

{
    for (int j = 0; j < 64; ++j) {
        printf("Read Initial Register S3_0_c5_c6_1 bit %02d: %016llx\n", j, read_sprr());
    }
}


    for (int i = 0; i < 64; ++i) {
        write_sprr(1ULL<<i);
        printf("Flipped Register S3_0_c5_c6_1 bit %02d: %016llx\n", i, read_sprr());
    }
}

