// Note that this Source does NOT work on an iPhone 11 due to the Return Value ... need to verify the correct Return.. and it could be a cryptexd issue, toybox.... lots of mving parts.. if anyone has input please open an Issue
#define _XOPEN_SOURCE
#include <signal.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/utsname.h>
#include <ucontext.h>

static void sev_handler(int signo, siginfo_t *info, void *cx_)
{
/*    printf("Now in sev_handler\n"); */
    (void)signo;
    (void)info;
    ucontext_t *cx = cx_;
    cx->uc_mcontext->__ss.__x[0] = 0xdeadbeef;
    cx->uc_mcontext->__ss.__opaque_pc = cx->uc_mcontext->__ss.__opaque_lr;
}

static void bus_handler(int signo, siginfo_t *info, void *cx_)
{
/*    printf("Now in bus_handler\n"); */
    (void)signo;
    (void)info;
    ucontext_t *cx = cx_;
    cx->uc_mcontext->__ss.__x[0] = 0xdeadbeef;
    cx->uc_mcontext->__ss.__opaque_pc += 4;
}

static void write_sprr_perm(uint64_t v)
{
    printf("Now in write_sprr_perm\n");
    __asm__ __volatile__("msr S3_6_c15_c1_5, %0\n"
                         "isb sy\n" ::"r"(v)
                         :);
    printf("Now past write_sprr_perm\n");
}

static uint64_t read_sprr_perm(void)
{
    printf("Now in read_sprr_perm\n");
    uint64_t v;
    __asm__ __volatile__("isb sy\n"
                         "mrs %0, S3_6_c15_c1_5\n"
                         : "=r"(v)::"memory");
    return v;
}

static bool can_read(void *ptr)
{
    printf("Now in can_read\n");
    uint64_t v = 0;
    printf("Now in can_read past uint and hitting volatile...\n");

    __asm__ __volatile__("ldr x0, [%0]\n"
                         "mov %0, x0\n"
                         : "=r"(v)
                         : "r"(ptr)
                         : "memory", "x0");
    printf("Now past volatile in can_read\n");

    if (v == 0xdeadbeef)
        return false;
    return true;
}

static bool can_write(void *ptr)
{
    printf("Now in can_write\n");
    uint64_t v = 0;

    __asm__ __volatile__("str x0, [%0]\n"
                         "mov %0, x0\n"
                         : "=r"(v)
                         : "r"(ptr + 4)
                         : "memory", "x0");

    if (v == 0xdeadbeef)
        return false;
    return true;
}

static bool can_exec(void *ptr)
{
    printf("Now in can exec\n");
    uint64_t (*fun_ptr)(uint64_t) = ptr;
    uint64_t res = fun_ptr(0);
    if (res == 0xdeadbeef)
        return false;
    return true;
}

static void sprr_test(void *ptr, uint64_t v)
{
    printf("Now in sprr_test\n");
    uint64_t a, b;
    a = read_sprr_perm();
    printf("after a = read_sprr_perm a:%llx\n", a);
    write_sprr_perm(v);
    printf("after write_sprr_perm(v) v:%llx\n", v);
    b = read_sprr_perm();
    printf("after b = write_sprr_perm b:%llx\n", b);

    printf("Final Value:%llx: %c%c%c\n", b, can_read(ptr) ? 'r' : '-', can_write(ptr) ? 'w' : '-',
           can_exec(ptr) ? 'x' : '-');
/*        printf("----begin added printfs-----\n\r");
        printf("ptr: %u\n", ptr);
        printf("a:%llx\n", a);
        printf("v:%llx\n", v);
        printf("memory:%llu\n", "memory");
        printf("bv %02d: %016llx\n", b, v);
        printf("va:%c%c%c\n %u\n", v, a);
        printf("b:%c\n", b);
        printf("a:%llx\n", a);
        printf("----end added printfs-----\n\r");
*/
/*    printf("bit %02d: %016llx\n", i, read_sprr()); */
}

static uint64_t make_sprr_val(uint8_t nibble)
{
    uint64_t res = 0;
    for (int i = 0; i < 16; ++i)
        res |= ((uint64_t)nibble) << (4 * i);
    return res;
}

uint64_t read_sprr(void)
{
    uint64_t v;
    __asm__ __volatile__("isb sy\n"
                         "mrs %0, S3_6_c15_c1_5\n"
                         : "=r"(v)::"memory");
    return v;
}

int main(int argc, char *argv[])
{
    printf("Start inside Main\n");
    (void)argc;
    (void)argv;
    printf("Now hitting struct sigaction\n");
    struct sigaction sa;
    printf("Now hitting sigfillset(&sa.sa_mask)\n");
    sigfillset(&sa.sa_mask);
    printf("Now hitting sa.sa_sigaction = bus_handler\n");
    sa.sa_sigaction = bus_handler;
    printf("Now hitting sa.sa_flags = SA_RESTART | SA_SIGINFO\n");
    sa.sa_flags = SA_RESTART | SA_SIGINFO;
    printf("Now hitting sigaction(SIGBUS, &sa, 0)\n");
    sigaction(SIGBUS, &sa, 0);
    printf("Now hitting sa.sa_sigaction = sev_handler\n");
    sa.sa_sigaction = sev_handler;
    printf("Now hitting sigaction(SIGSEGV, &sa\n");
    sigaction(SIGSEGV, &sa, 0);
    printf("Now hitting uint32_t *ptr = mmap(NULL, 0x4000, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_PRIVATE | MAP_ANONYMOUS | MAP_JIT, -1, 0)\n");
    uint32_t *ptr = mmap(NULL, 0x4000, PROT_READ | PROT_WRITE | PROT_EXEC,
                         MAP_PRIVATE | MAP_ANONYMOUS | MAP_JIT, -1, 0);
    write_sprr_perm(0x3333333333333333);
    printf("Now bypassing main at RET ptr[0] 0xD65F03C0 because this the return value needs to be checked for iPhone 11 and the program is about to hang.............\n");

//    ptr[0] = 0xD65F03C0; // ret
//    ptr[0] = 0x00201420; // ret
printf("Now past main at RET ptr[0] 0x00201420\n");
    printf("Hitting for (int i = 0; i < 4; ++i)\n");
    for (int i = 0; i < 4; ++i)
        sprr_test(ptr, make_sprr_val(i));
    printf("Bottom of main{}\n");
/*        return 0;
 */
}
