/* 
 Orignal Blog Post: https://blog.svenpeter.dev/posts/m1_sprr_gxf/
 
 Comments, Build, Profiling Instructions added by dhoyt | @h02332 on May 23, 2021
 UBSAN Report with Xcode Profiling Instructions

QUICK COMPILE:  clang -O0 -fsanitize=undefined -g -o a.out this_code.c

BUILD 
 	clang -fprofile-instr-generate -fcoverage-mapping -mllvm -runtime-counter-relocation -g -fsanitize=undefined -O0 -o a.out cpde.c
 
PROFILE 
 	LLVM_PROFILE_FILE=default.profraw ./a.out
	xcrun llvm-profdata merge -sparse default.profraw -o da.profdata
	xcrun llvm-cov show ./a.out -instr-profile=dub.profdata

REPORT
 xcrun llvm-cov show ./a.out -instr-profile=dub.profdata --show-regions=0 -show-line-counts-or-regions -show-instantiation-summary
 xcrun llvm-cov report ./a.out -instr-profile=dub.profdata
 sudo gcovr --gcov-executable "xcrun llvm-cov gcov" -r . --html --html-details -o out.html

RUN
	LLVM_PROFILE_FILE=default.profraw ./a.out

COMMENT
	Errors Seen - .. undefined behavior Illegal Instruction:4
	Note that no crash is seen with libgmalloc, so the allocator needs more investigation
	
UNDEFINED BEHAVIOR SANITIZER OUTPUT - UBSAN
================================================

REPRO - SIP OFF, ALL M1 SECURITY OFF

LLVM_PROFILE_FILE=default.profraw ./a.out
...
Start __volatile__ can_read
ptime.c:32:9: runtime error: member access within misaligned address 0x00016d8eae88 for type 'ucontext_t' (aka 'struct __darwin_ucontext'), which requires 16 byte alignment
0x00016d8eae88: note: pointer points here
 00 00 00 00  00 00 00 00 00 00 00 00  20 ae 8e 6d 01 00 00 00  00 00 00 00 00 00 00 00  00 00 00 00
              ^
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ptime.c:32:9 in
ptime.c:32:9: runtime error: load of misaligned address 0x00016d8eaeb8 for type 'struct __darwin_mcontext64 *', which requires 16 byte alignment
0x00016d8eaeb8: note: pointer points here
 00 00 00 00  c0 ae 8e 6d 01 00 00 00  00 80 58 02 01 00 00 00  0f 00 00 92 00 00 00 00  1c 00 00 00
              ^
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ptime.c:32:9 in
ptime.c:33:9: runtime error: member access within misaligned address 0x00016d8eae88 for type 'ucontext_t' (aka 'struct __darwin_ucontext'), which requires 16 byte alignment
0x00016d8eae88: note: pointer points here
 00 00 00 00  00 00 00 00 00 00 00 00  20 ae 8e 6d 01 00 00 00  00 00 00 00 00 00 00 00  00 00 00 00
              ^
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ptime.c:33:9 in
ptime.c:33:9: runtime error: load of misaligned address 0x00016d8eaeb8 for type 'struct __darwin_mcontext64 *', which requires 16 byte alignment
0x00016d8eaeb8: note: pointer points here
 00 00 00 00  c0 ae 8e 6d 01 00 00 00  00 80 58 02 01 00 00 00  0f 00 00 92 00 00 00 00  ef be ad de
              ^
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ptime.c:33:9 in
End __volatile__ can_read
...
Hitting uint64_t res = fun_ptr(0)
ptime.c:22:9: runtime error: member access within misaligned address 0x00016d8eae88 for type 'ucontext_t' (aka 'struct __darwin_ucontext'), which requires 16 byte alignment
0x00016d8eae88: note: pointer points here
 00 00 00 00  00 00 00 00 00 00 00 00  20 ae 8e 6d 01 00 00 00  00 00 00 00 00 00 00 00  00 00 00 00
              ^
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ptime.c:22:9 in
ptime.c:22:9: runtime error: load of misaligned address 0x00016d8eaeb8 for type 'struct __darwin_mcontext64 *', which requires 16 byte alignment
0x00016d8eaeb8: note: pointer points here
 00 00 00 00  c0 ae 8e 6d 01 00 00 00  00 c0 58 02 01 00 00 00  07 00 00 82 00 00 00 00  ef be ad de
              ^
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ptime.c:22:9 in
ptime.c:23:38: runtime error: member access within misaligned address 0x00016d8eae88 for type 'ucontext_t' (aka 'struct __darwin_ucontext'), which requires 16 byte alignment
0x00016d8eae88: note: pointer points here
 00 00 00 00  00 00 00 00 00 00 00 00  20 ae 8e 6d 01 00 00 00  00 00 00 00 00 00 00 00  00 00 00 00
              ^
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ptime.c:23:38 in
ptime.c:23:38: runtime error: load of misaligned address 0x00016d8eaeb8 for type 'struct __darwin_mcontext64 *', which requires 16 byte alignment
0x00016d8eaeb8: note: pointer points here
 00 00 00 00  c0 ae 8e 6d 01 00 00 00  00 c0 58 02 01 00 00 00  07 00 00 82 00 00 00 00  ef be ad de
              ^
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ptime.c:23:38 in
ptime.c:23:9: runtime error: member access within misaligned address 0x00016d8eae88 for type 'ucontext_t' (aka 'struct __darwin_ucontext'), which requires 16 byte alignment
0x00016d8eae88: note: pointer points here
 00 00 00 00  00 00 00 00 00 00 00 00  20 ae 8e 6d 01 00 00 00  00 00 00 00 00 00 00 00  00 00 00 00
              ^
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ptime.c:23:9 in
ptime.c:23:9: runtime error: load of misaligned address 0x00016d8eaeb8 for type 'struct __darwin_mcontext64 *', which requires 16 byte alignment
0x00016d8eaeb8: note: pointer points here
 00 00 00 00  c0 ae 8e 6d 01 00 00 00  00 c0 58 02 01 00 00 00  07 00 00 82 00 00 00 00  ef be ad de
              ^
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ptime.c:23:9 in
Executed uint64_t res = fun_ptr(0)
...
Thread 0 Crashed:: Dispatch queue: com.apple.main-thread
0   dyld                          	0x0000000102ea4000 0x102ea4000 + 0
1   code				                  	0x0000000102dbbcc4 sprr_test + 80 (code.c:92)
2   code        				          	0x0000000102dbb684 main + 172 (code.c:122)
3   libdyld.dylib                 	0x0000000186c89420 start + 4

Thread 0 crashed with ARM Thread State (64-bit):
    x0: 0x0000000041414141   x1: 0x0000000000000000   x2: 0x0000000000000007   x3: 0x0000000000041802
    x4: 0x00000000ffffffff   x5: 0x0000000000000000   x6: 0x0000000000000000   x7: 0x0000000000000000
    x8: 0x0000000102ea0000   x9: 0x0000000041414141  x10: 0x0000000000000000  x11: 0x00000001fe0525cb
   x12: 0x00000001fe0525cb  x13: 0x0000000000000033  x14: 0x0000000000000881  x15: 0x000000008000001f
   x16: 0x00000000000000c5  x17: 0x0000000102ec5f24  x18: 0x0000000000000000  x19: 0x2010000030000000
   x20: 0x0000000102ea0000  x21: 0x0000000000000000  x22: 0x0000000000000000  x23: 0x0000000000000000
   x24: 0x0000000000000000  x25: 0x0000000000000000  x26: 0x0000000000000000  x27: 0x0000000000000000
   x28: 0x000000016d047648   fp: 0x000000016d047590   lr: 0x0000000102dbbd98
    sp: 0x000000016d047590   pc: 0x0000000102ea4000 cpsr: 0x60000000
   far: 0x0000000102ea3ffc  esr: 0x02000000


Binary Images:
       0x102db8000 -        0x102dbbfff +smoke32-user (0) smoke32-user
       0x102ea4000 -        0x102f23fff  dyld (851.27)  /usr/lib/dyld
       0x102fac000 -        0x102fd7fff +libclang_rt.ubsan_osx_dynamic.dylib (1205.0.22.9) ../clang/12.0.5/lib/darwin/libclang_rt.ubsan_osx_dynamic.dylib

Register Info:
bit 1 in S3_6_C15_C1_0 / SPRR_CONFIG_EL1 enables SPRR and access to new system registers.

S3_6_C15_1_5 is the permissions register for EL0 and S3_6_C15_1_6 is for EL1/GL1.

SYS_SPRR_CONFIG_EL1       sys_reg(3, 6, 15, 1, 0)
SPRR_CONFIG_EN            BIT(0)
SPRR_CONFIG_LOCK_CONFIG   BIT(1)
SPRR_CONFIG_LOCK_PERM_EL0 BIT(4)
SPRR_CONFIG_LOCK_PERM_EL1 BIT(5)

SYS_SPRR_PERM_EL0 sys_reg(3, 6, 15, 1, 5)
SYS_SPRR_PERM_EL1 sys_reg(3, 6, 15, 1, 6)

*/
#define _XOPEN_SOURCE
#define MAG(string)  "\e[0;35m" string "\x1b[0m"
#define BLUE(string) "\x1b[34m" string "\x1b[0m"
#define RED(string) "\x1b[31m" string "\x1b[0m"
#define WHT(string)"\e[0;37m" string "\x1b[0m"
#define GRN(string)"\e[0;32m" string "\x1b[0m"
#define YEL(string)"\e[0;33m" string "\x1b[0m"
#define CYN(string)"\e[0;36m" string "\x1b[0m"
#define HWHT(string)"\e[0;97m" string "\x1b[0m"
#define NORMAL_COLOR(string)"\x1B[0m" string "\x1b[0m"
#include <signal.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/utsname.h>
#include <ucontext.h>
#include <stdlib.h>
#include <time.h>
#include <syslog.h>
#include <dirent.h>
#include <sys/types.h>
#include <unistd.h>
#include <limits.h>

static void sev_handler(int signo, siginfo_t *info, void *cx_)
{
//    printf("Now in sev_handler\n");
    (void)signo;
    (void)info;
//    printf("Now in sev_handler at ucontext_t *cx = cx_;\n");
    ucontext_t *cx = cx_;
//    printf("Now in sev_handler at cx->uc_mcontext->__ss.__x[0] = 0xdeadbeef;\n");
    cx->uc_mcontext->__ss.__x[0] = 0xdeadbeef;
//    printf("Now in sev_handler at cx->uc_mcontext->__ss.__pc = cx->uc_mcontext->__ss.__lr;\n");
    cx->uc_mcontext->__ss.__pc = cx->uc_mcontext->__ss.__lr;
}

static void bus_handler(int signo, siginfo_t *info, void *cx_)
{
//    printf("Now in bus_handler\n");
    (void)signo;
    (void)info;
//    printf("Now in bus_handler at ucontext_t *cx = cx_;\n");
    ucontext_t *cx = cx_;
//    printf("Now in bus_handler at cx->uc_mcontext->__ss.__x[0] = 0xdeadbeef;\n");
    cx->uc_mcontext->__ss.__x[0] = 0xdeadbeef;
//    printf("Now in bus_handler at cx->uc_mcontext->__ss.__pc += 4;\n");
    cx->uc_mcontext->__ss.__pc += 4;
}

static void write_sprr_perm(uint64_t v)
{
    printf("Jumped to write_sprr_perm... Step 1...\n");
    clock_t start = clock();
    printf("Start __volatile__ write_sprr_perm\n");
    __asm__ __volatile__("msr S3_6_c15_c1_5, %0\n"
                         "isb sy\n" ::"r"(v)
                         :);
    printf("End __volatile__ write_sprr_perm\n");
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
        printf("End write_sprr_perm\n");
        printf("Finished write_sprr_perm ... Time elapsed for write_sprr_perm in ms: %f\n\n", elapsed);
}

static uint64_t read_sprr_perm(void)
{
    printf("Jumped to read_sprr_perm... Step 4...\n");
    clock_t start = clock();
    printf("Hitting read_sprr_perm at uint64_t v;\n");
    uint64_t v;
    printf("Start __volatile__ read_sprr_perm\n");
    __asm__ __volatile__("isb sy\n"
                         "mrs %0, S3_6_c15_c1_5\n"
                         : "=r"(v)::"memory");
    printf("End __volatile__ read_sprr_perm\n");
    printf("End read_sprr_perm\n");
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
    printf("Finished read_sprr_perm ... Time elapsed for read_sprr_perm in ms: %f\n\n", elapsed);
    return v;
}

static bool can_read(void *ptr)
{
    printf("Jumped to can_read... Step 5...\n");
    clock_t start = clock();
    printf("Hitting can_read at uint64_t v = 0\n");
    uint64_t v = 0;
    printf("Start __volatile__ can_read\n");
    __asm__ __volatile__("ldr x0, [%0]\n"
                         "mov %0, x0\n"
                         : "=r"(v)
                         : "r"(ptr)
                         : "memory", "x0");
    printf("End __volatile__ can_read\n");
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
    printf("Hitting 0xdeadbeef in can_read\n");
    printf("Finished... Time elapsed for can_read in ms: %f\n\n", elapsed);
    if (v == 0xdeadbeef)
        return false;
    return true;
}

static bool can_write(void *ptr)
{
    printf("Jumped to can_write... Step 6...\n");
    clock_t start = clock();
    printf("Hitting can_write at uint64_t v = 0\n");
    uint64_t v = 0;
    printf("Start __volatile__ can_write\n");
    __asm__ __volatile__("str x0, [%0]\n"
                         "mov %0, x0\n"
                         : "=r"(v)
                         : "r"(ptr + 8)
                         : "memory", "x0");
    printf("End __volatile__ can_write\n");
    printf("Hitting 0xdeadbeef in can_write\n");
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
        printf("Finished... Time elapsed for can_write in ms: %f\n\n", elapsed);
    if (v == 0xdeadbeef)
        return false;
    return true;
}

static bool can_exec(void *ptr)
{
    printf("Jumped to can_exec... Step 7...\n");
    clock_t start = clock();
    printf("Hitting can_exec at uint64_t (*fun_ptr)(uint64_t) = ptr\n");
    uint64_t (*fun_ptr)(uint64_t) = ptr;
    printf("Hitting uint64_t res = fun_ptr(0)\n");
    uint64_t res = fun_ptr(0);
    printf("Executed uint64_t res = fun_ptr(0)\n");
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
    printf("Hitting 0xdeadbeef in can_exec\n");
    printf("Finished... Time elapsed in can_exec in ms: %f\n\n", elapsed);
    if (res == 0xdeadbeef)
        return false;
    return true;
}

static void sprr_test(void *ptr, uint64_t v)
{
    printf("Jumped to sprr_test.. Step 3...\n");
    clock_t start = clock();
    printf("Now at sprr_test before uint64_t a, b\n");
    uint64_t a, b;
    printf("Completed at sprr_test after uint64_t a, b\n");
    printf("Now at sprr_test before a = read_sprr_perm()\n\n");
    a = read_sprr_perm();
    printf("Completed at sprr_test following a = read_sprr_perm()\n\n");
    write_sprr_perm(v);
    printf("Completed at sprr_test following write_sprr_perm(v)\n\n");
    printf("Now at sprr_test before b = read_sprr_perm()\n\n");
    b = read_sprr_perm();
    printf("Finished at sprr_test after b = read_sprr_perm()\n\n");
    
    printf("Register Value:%llx: %c%c%c\n", b, can_read(ptr) ? 'r' : '-', can_write(ptr) ? 'w' : '-',
           can_exec(ptr) ? 'x' : '-');
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
        printf("Finished.... Time elapsed for sprr_test in ms: %f\n\n", elapsed);
}

static uint64_t make_sprr_val(uint8_t nibble)
{
    printf("Jumped to make_sprr_val.. Step 2...\n");
    clock_t start = clock();
    printf("Hitting make_sprr_val at uint64_t res = 0\n");
    uint64_t res = 0;
    printf("Hitting make_sprr_val at int i = 0; i < 16; ++i \n");
    for (int i = 0; i < 16; ++i)
        res |= ((uint64_t)nibble) << (4 * i);
    printf("End of make_sprr_val\n");
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
        printf("Finished... Time elapsed for make_sprr_val in ms: %f\n\n", elapsed);
    return res;
}

uint64_t read_sprr(void)
{
//    This is now a void() and returns nothing to see here.. thank you .. drive thru..
//    printf("Jumped to read_sprr\n");
//    clock_t start = clock();

    uint64_t v;
    
//    printf("Start __volatile__ read_sprr\n");
    __asm__ __volatile__("isb sy\n"
                         "mrs %0, S3_6_c15_c1_5\n"
                         : "=r"(v)::"memory");
//    printf("Finished in __volatile__ read_sprr\n");
//    clock_t stop = clock();
//        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
//        printf("Finished... Time elapsed in read_sprr for ms: %f\n\n", elapsed);
    return v;
}

int main(int argc, char *argv[])
{
    //    printf("Program name is: %s\n", argv[0]);
    printf(RED("------------------------------------------------------------------------------") "\n");
    printf(CYN("Original Code by: Sven Peter @svenpeter42 | Modified by David Hoyt @h02332\n"));
    printf(RED("------------------------------------------------------------------------------") "\n");
        char cwd[PATH_MAX];
        getcwd(cwd, sizeof(cwd));
    printf("Starting M1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check as: %s in Current working dir: %s\n", argv[0], cwd);
    printf("Writing to Logfile %s.log for M1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check as: %s in Current working dir: %s\n", argv[0], argv[0], cwd);
    printf("Writing to Syslogd at LOG_NOTICE for M1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check as: %s in Current working dir: %s\n", argv[0], cwd);
    FILE *f;
    f = fopen("ptime.log", "a+"); // a+ (create + append) option will allow appending which is useful in a log file
    if (f == NULL) { /* Something is wrong   */}
    fprintf(f, "Starting M1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check\n");
//    printf(RED("------------------------------------------------------------------------------") "\n");
    printf(HWHT("\nSystem Software & Hardware:\n"));
    system("uname -a\n");
    system("sysctl machdep.cpu.brand_string\n");
//    printf(RED("---------------------------") "\n");
    setlogmask (LOG_UPTO (LOG_NOTICE));
    openlog ("Starting M1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check", LOG_CONS | LOG_PID | LOG_NDELAY, LOG_LOCAL1);
    syslog (LOG_NOTICE, "Starting M1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check as: %s", argv[0]);
    closelog ();
//    printf(RED("---------------------------") "\n");
    // variables to store the date and time components
    int hours, minutes, seconds, day, month, year;
 
    // `time_t` is an arithmetic time type
    time_t now;
 
    // Obtain current time
    // `time()` returns the current time of the system as a `time_t` value
    time(&now);

    // localtime converts a `time_t` value to calendar time and
    // returns a pointer to a `tm` structure with its members
    // filled with the corresponding values
    struct tm *local = localtime(&now);
 
    hours = local->tm_hour;         // get hours since midnight (0-23)
    minutes = local->tm_min;        // get minutes passed after the hour (0-59)
    seconds = local->tm_sec;        // get seconds passed after a minute (0-59)
 
    day = local->tm_mday;            // get day of month (1 to 31)
    month = local->tm_mon + 1;      // get month of year (0 to 11)
    year = local->tm_year + 1900;   // get year since 1900
 
    // print the current date
    // printf("Run Date (D/M/Y) = %02d/%02d/%d\n", day, month, year);
    
    // print local time
/*
    if (hours < 12) {    // before midday
        printf("MS Timer Start at %02d:%02d:%02d am\n", hours, minutes, seconds);
    }
    else {    // after midday
        printf("MS Timer Start at %02d:%02d:%02d pm\n", hours - 12, minutes, seconds);
    }
*/
//    printf(RED("---------------------------") "\n");
//    printf(RED("---------------------------") "\n");
    
       // Convert to local time format and print to stdout
       // printf("Today is %s\n", ctime(&now));
//    printf(RED("------------------------------------------------------------------------------") "\n");
    printf(GRN("\nTimestamp: " "%s\n") "",ctime(&now));
//    printf(RED("------------------------------------------------------------------------------") "\n");
    clock_t start = clock();
    
    (void)argc;
    (void)argv;
    printf("Now hitting main() struct sigaction\n");
    struct sigaction sa;
    printf("Now hitting main() sigfillset(&sa.sa_mask)\n");
    sigfillset(&sa.sa_mask);
    printf("Now hitting main() sa.sa_sigaction = bus_handler\n");
    sa.sa_sigaction = bus_handler;
    printf("Now hitting main() sa.sa_flags = SA_RESTART | SA_SIGINFO\n");
    sa.sa_flags = SA_RESTART | SA_SIGINFO;
    printf("Now hitting main() sigaction SIGBUS, &sa, 0\n");
    sigaction(SIGBUS, &sa, 0);
    printf("Now hitting main() sa.sa_sigaction = sev_handler\n");
    sa.sa_sigaction = sev_handler;
    printf("Now hitting main() sigaction SIGSEGV, &sa\n");
    sigaction(SIGSEGV, &sa, 0);
    printf("Now hitting main() uint32_t *ptr = mmap(NULL, 0x4000, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_PRIVATE | MAP_ANONYMOUS | MAP_JIT, -1, 0)\n\n");
    uint32_t *ptr = mmap(NULL, 0x4000, PROT_READ | PROT_WRITE | PROT_EXEC,
                         MAP_PRIVATE | MAP_ANONYMOUS | MAP_JIT, -1, 0);
    printf("Now hitting main() write_sprr_perm(0x3333333333333333)\n\n");
    write_sprr_perm(0x3333333333333333);
    printf("Just executed main() write_sprr_perm(0x3333333333333333)\n\n");
    printf("Now in main() hitting ptr[0] 0xd65f03c0 RET\n\n");
    ptr[0] = 0xd65f03c0; // ret
    printf("Now in main() hitting for (int i = 0; i < 4; ++i)\n\n");
    for (int i = 0; i < 4; ++i)
        sprr_test(ptr, make_sprr_val(i));
    clock_t stop = clock();
        double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
    printf(GRN("main () finished... Total Elapsed Time in ms: %f\n\n"), elapsed);
    //printf("Done at %s", ctime(&now));
    printf(CYN("M1 SPRR Permission Configuration Register (EL0) S3_6_c15_c1_5 check ended at " "%s") "",ctime(&now));
/*
 char cwd[PATH_MAX];
    if (getcwd(cwd, sizeof(cwd)) != NULL) {
        printf("Current working dir: %s\n", cwd);
    } else {
        perror("getcwd() error");
        return 1;
    }
 return(0);
 */
/*
    DIR *dr;
    struct dirent *en;
    dr = opendir("."); //open all or present directory
    if (dr) {
       while ((en = readdir(dr)) != NULL) {
          printf("%s\n", en->d_name); //print all directory name
       }
       closedir(dr); //close all directory
    }
    return(0);
*/
 }
/* 

RETURN VALUE = 0xd65f03c0

Baseline Results of S3_6_c15_c1_5 Register Bits:
cx->uc_mcontext->__ss.__pc +=   + 4
2010000030000000: ---
2010000030100000: r-x
2010000030200000: r--
2010000030300000: rw-

Fuzzing Results of __ss.__pc for (int i = 0; i < 18; ++i):
cx->uc_mcontext->__ss.__pc +=   + 1
2010000030000000: ---
2010000030100000: r-x
2010000030200000: r--
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 2
2010000030000000: ---
2010000030100000: r-x
2010000030200000: r--
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 3
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 4
2010000030000000: ---
2010000030100000: r-x
2010000030200000: r--
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 5
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 6
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 7
2010000030000000: ---
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 8
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 9
2010000030000000: ---
2010000030100000: r-x
2010000030200000: r--
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 10
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 11
2010000030000000: ---
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 12
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 13
2010000030000000: ---
2010000030100000: r-x
2010000030200000: r--
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 14
2010000030000000: ---
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 15
2010000030000000: ---
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 16
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 17
2010000030000000: rw-
2010000030100000: rwx
2010000030200000: rw-
2010000030300000: rw-
cx->uc_mcontext->__ss.__pc +=   + 18
2010000030000000: ---
2010000030100000: r-x
2010000030200000: r--
2010000030300000: rw-


*/
