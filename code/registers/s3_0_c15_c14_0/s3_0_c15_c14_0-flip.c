#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <os/log.h>
#include <unistd.h>


void write_register(uint64_t v)
{
    __asm__ __volatile__("msr s3_0_c15_c14_0, %0\n"
                         "isb sy\n" ::"r"(v)
                         :);
}

uint64_t read_register(void)
{
    uint64_t v;
    __asm__ __volatile__("isb sy\n"
                         "mrs %0, s3_0_c15_c14_0\n"
                         : "=r"(v)::"memory");
    return v;
}


int main(int argc, char *argv[]) { 
{
    pid_t pid = getpid();
	printf("register test for s3_0_c15_c14_0 from pid %d!\n", pid);
    os_log_t log = os_log_create("com.example.cryptex.register-test", "run register s3_0_c15_c14_0 test");
    os_log_info(log, "register test for s3_0_c15_c14_0 from pid %d!", pid);
	return 0;
}
{

    for (int i = 0; i < 64; ++i) {
        write_register(1ULL<<i);
        printf("Flipped Register s3_0_c15_c14_0 bit %02d: %016llx\n", i, read_register());
    }
}
}