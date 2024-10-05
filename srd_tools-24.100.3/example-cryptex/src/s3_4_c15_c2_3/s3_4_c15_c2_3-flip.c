#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <os/log.h>
#include <unistd.h>


void write_register(uint64_t v)
{
    __asm__ __volatile__("msr s3_4_c15_c2_3, %0\n"
                         "isb sy\n" ::"r"(v)
                         :);
}

uint64_t read_register(void)
{
    uint64_t v;
    __asm__ __volatile__("isb sy\n"
                         "mrs %0, s3_4_c15_c2_3\n"
                         : "=r"(v)::"memory");
    return v;
}


int main(int argc, char *argv[]) { 
{
    pid_t pid = getpid();
	printf("run register test s3_4_c15_c2_3-flip from pid %d!\n", pid);
    os_log_t log = os_log_create("com.example.cryptex.s3_4_c15_c2_3-read", "run register test s3_4_c15_c2_3-flip");
    os_log_info(log, "register from pid %d!", pid);
	return 0;
}
{

    for (int i = 0; i < 64; ++i) {
        write_register(1ULL<<i);
        printf("Flipped Register s3_4_c15_c2_3 bit %02d: %016llx\n", i, read_register());
    }
}
}