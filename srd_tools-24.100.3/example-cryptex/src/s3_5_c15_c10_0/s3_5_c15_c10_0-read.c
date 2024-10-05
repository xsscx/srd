#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>


void write_sprr(uint64_t v)
{
    __asm__ __volatile__("msr s3_5_c15_c10_0, %0\n"
                         "isb sy\n" ::"r"(v)
                         :);
}

uint64_t read_sprr(void)
{
    uint64_t v;
    __asm__ __volatile__("isb sy\n"
                         "mrs %0, s3_5_c15_c10_0\n"
                         : "=r"(v)::"memory");
    return v;
}


int main(int argc, char *argv[])
{
    for (int i = 0; i < 64; ++i) {

        printf("s3_5_c15_c10_0 bit %02d: %016llx\n", i, read_sprr());
    }
}
