#include "checksum.h"
#include <string.h>


/* Add up checksum, return value will be filled in checksum filed in header */
u_short add_checksum(u_short len_udp,
		     int padding, const u_short *temp)
{
  u_short prot_udp = 17;
  u_short padd = 0;
  u_short word16;
  u_long sum;
  static u_char buff[1600];
  int i;
  memset(buff, 0, 1600);
  memcpy(buff, temp, len_udp);

	// take padding into account
  if ((padding & 1) == 1)
    {
      padd = 1;
      buff[len_udp] = 0;
    }

  //initialize sum to zero
  sum = 0;

  // make 16 bit words out of every two adjacent 8 bit words and
  // calculate the sum of all 16 vit words
  for (i = 0; i < len_udp + padd; i = i + 2)
    {
      word16 = ((buff[i] << 8) & 0xFF00) + (buff[i + 1] & 0xFF);
      //cout << hex << (int) buff[i] << " " << (int) buff[i + 1] << " ";
      sum = sum + (unsigned long) word16;
    }
  while (sum >> 16)
    sum = (sum & 0xFFFF) + (sum >> 16);
  sum = ~sum;

  return ((u_short) sum);

}
