#ifndef CHECKSUM_HEADER
#define CHECKSUM_HEADER
#include "header.h"
/* Add up checksum, return value will be filled in checksum filed in header */
u_short add_checksum(u_short len_udp, int padding, const u_short *temp);
#endif
