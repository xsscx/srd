#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <os/log.h>
#include <unistd.h>


void write_register(uint64_t v)
{
    __asm__ __volatile__("msr S3_6_c15_c1_0, %0\n"
                         "isb sy\n" ::"r"(v)
                         :);
}

uint64_t read_register(void)
{
    uint64_t v;
    __asm__ __volatile__("isb sy\n"
                         "mrs %0, S3_6_c15_c1_0\n"
                         : "=r"(v)::"memory");
    return v;
}


int main(int argc, char *argv[])
{

{
    for (int j = 0; j < 64; ++j) {
        printf("Read Initial Register S3_6_c15_c1_0 bit %02d: %016llx\n", j, read_register());
    }
}


    for (int i = 0; i < 64; ++i) {
        write_register(1ULL<<i);
        printf("Flipped Register S3_6_c15_c1_0 bit %02d: %016llx\n", i, read_register());
    }
}

