/*
 * project:       tftp client program
 * author:        Oscar Sanchez (oms1005@gmail.com)
 * description:   a small tftp (trivial ftp) client program
*/
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <netdb.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <stdarg.h>
#include <getopt.h>
#include <fcntl.h>
#include <assert.h>
#include <sys/select.h>
#include <sys/uio.h>
#include <strings.h>
#include <sys/stat.h>
#include "header.h"
#include "checksum.h"

#define RETRY 10

int recvfromTimeOut(int socket, long sec, long usec)
{
	// Setup timeval variable
	struct timeval timeout;
	timeout.tv_sec = sec;
	timeout.tv_usec = usec;
	// Setup fd_set structure
	fd_set fds;
	FD_ZERO(&fds);
	FD_SET(socket, &fds);
	// >0: data ready to be read
	return select(FD_SETSIZE, &fds, NULL, NULL, &timeout);
}

/* Returns the recv message */
int tftp(int sockfd, const void * packet, int expected_seqnum, int timeout, int flag ) {
	int numbytes = 0, ret = 0, retry = RETRY;
	int is_retransmit = 0;
	char ackbuf[HEADER_SIZE];
	header_t head;
	int res = 0;  	/* Timer/Select Variable */

	do {
		
		/* Try to send the packet */
		if ((numbytes = send(sockfd, packet, PACKET_SIZE, 0)) == -1) {
			perror("Error in tftp");
			exit(1);
		} else if (numbytes >0) {
			if (flag == ACK){
				printf("Packet ");
				if(is_retransmit)
					printf("'%d' Re-transmitted.\n", expected_seqnum);
				else
					printf("'%d' sent\n", expected_seqnum);
			} else {
				printf("FIN ");
				if(is_retransmit)
					printf("'%d' Re-transmitted.\n", expected_seqnum);
				else
					printf("'%d' sent\n", expected_seqnum);
			}

		}

			//sleep(1);

		/* Start the timeout */
		res = recvfromTimeOut(sockfd, 0, timeout);

		switch (res)
		{
			case 0:
					// Timed out, do whatever you want to handle this situation
				printf("Packet '%d' ******Timed Out*****, %d retries left\n", expected_seqnum, retry-1);
				is_retransmit = 1;
				ret = -2;
				break;
			
			case -1:
					// Error occured, maybe we should display an error message?
				printf("ERROR with timer recvfromTimeOut()\n");
				exit(-1);
				break;
				
			default:
					// Ok the data is ready, call recvfrom() to get it then
					//printf("We are trying to received something\n");
					//ret = recv(sockfd,ackbuf,HEADER_SIZE,0);
				ret = recv(sockfd,ackbuf,HEADER_SIZE,0);
				if( ret == -1) {
					perror("Error in tftp");
					exit(1);				
				} 
				if (ret > 0) {
						//printf("We received something\n");
					read_header(&head, (packet_t *)ackbuf);
						//read_packet((u_char*) recved, (packet_t *)buf, (u_short) (numbytes - HEADER_SIZE));
					if ( (int) head.flag == ACK && (int) head.seq == expected_seqnum ) {
						printf("ACK '%d' received\n", expected_seqnum);
						return ret;
					} else if ( (int) head.flag == FIN && (int) head.seq == expected_seqnum ){
						ret -10;
						return ret;
						}
				}
				return ret;
			}
				
			} while(--retry);

			if (!retry && ret == -2) {
				printf("Packet '%d' failed with '%d' retries. \n", expected_seqnum, RETRY);
				ret = -1;
			}

			return ret;
}


// get sockaddr, IPv4 or IPv6:
void *get_in_addr(struct sockaddr *sa)
{
    if (sa->sa_family == AF_INET) {
        return &(((struct sockaddr_in*)sa)->sin_addr);
    }

    return &(((struct sockaddr_in6*)sa)->sin6_addr);
}

int main(int argc, char *argv[])
{
		int sockfd;
    struct addrinfo hints, *servinfo, *p;
    int rv;
    char s[INET6_ADDRSTRLEN];

		// used for inputs
		char ch, *filename = (char*) "sendfile.txt", *address = (char *) "127.0.0.1";
		int port = 69;


	  /* Read command line options */
	  while ((ch = getopt(argc, argv, "h:p:f:")) != -1) {
	    switch (ch) {
			case 'h':
				address = optarg;
				break;
			case 'p':
				port = atoi(optarg);
				break;
	    case 'f':
	      filename = optarg;
	      break;
	    case '?':
		      if (optopt == 'f') {
							fprintf(stderr, "Option -%c requires an argument\n", optopt);
		      } else {
							fprintf(stderr, "Unknown option\n");
		      }
	      exit(1);
	    }
	  }
    char PORT[10];
    sprintf(PORT,"%d",port);
		printf("Starting client connecting to host: %s on port: %d with filename: %s\n", address, port, filename );

    memset(&hints, 0, sizeof hints);
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;

    if ((rv = getaddrinfo(address, PORT, &hints, &servinfo)) != 0) {
        fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(rv));
        return 1;
    }

    // loop through all the results and connect to the first we can
    for(p = servinfo; p != NULL; p = p->ai_next) {
        if ((sockfd = socket(p->ai_family, p->ai_socktype,
                p->ai_protocol)) == -1) {
            perror("client: socket");
            continue;
        }

        if (connect(sockfd, p->ai_addr, p->ai_addrlen) == -1) {
            close(sockfd);
            perror("client: connect");
            continue;
        }

        break;
    }

    if (p == NULL) {
        fprintf(stderr, "client: failed to connect\n");
        return 2;
    }

    inet_ntop(p->ai_family, get_in_addr((struct sockaddr *)p->ai_addr),
            s, sizeof s);
    printf("client: connecting to %s\n", s);

    //freeaddrinfo(servinfo); // all done with this structure

		/* Set Socket to non blocking */
		fcntl(sockfd, F_SETFL, O_NONBLOCK);

		/* Initialize data*/
		char databuf[PAYLOAD_SIZE];
		char packetbuf[PACKET_SIZE];
		int seqnum = 0;
		packet_t packet;
		u_short checksum;
		int retry = RETRY;
		int numbytes = 0, ret = 0;
		FILE * filefd;

    struct stat finfo;
		int filesize=0;
		int send_results = 0;
		
		/* Initialize the arrays to zeros */
		bzero(databuf, PAYLOAD_SIZE);
		bzero(packetbuf, PACKET_SIZE);

		/* open the file for reading */ 
		if ((filefd = fopen(filename, "r"))  == NULL)
		{
			fprintf(stderr, "Could not open file for reading!\n");
			close(sockfd);
			return 2;
		} else {
			// if (-1 == stat(argv[3], &finfo))
			// 	fprintf(stderr,"error stating file!\n");
			printf("File '%s' of size '%d' bytes opened and ready to send filename\n", filename, (int)finfo.st_size );
		}

		/* Copy the filename to the buffer */
		strcpy(databuf, filename);
		databuf[PAYLOAD_SIZE] = '\0';

		/* create a packet */
		fill_header(seqnum, 0, PAYLOAD_SIZE, ACK, &packet);
		fill_packet((u_char*) &databuf[0], &packet, PAYLOAD_SIZE);
		/* calculate checksum */
		checksum = add_checksum(PACKET_SIZE, 0, (u_short*) &packet);
		packet.header.checksum = htons(checksum);
		//assert(add_checksum(PACKET_SIZE, 0, (u_short *)&packet) == 0);

		/* Send the filename... */
		send_results = tftp(sockfd, &packet, seqnum, 900000, ACK );
		if (send_results == -1) {
			fprintf(stderr, "Time out..\n");
			close(sockfd);
			return 2;
		} else if (send_results == -10) {
			printf("Received the final FIN.. Closing up shop.");
			fclose(filefd);
			close(sockfd);
			return 0;
		}	
		seqnum++;

		/* File Sending Section*/		
		/* Re-Initialize the arrays to zeros */
		bzero(databuf, PAYLOAD_SIZE);
		bzero(packetbuf, PACKET_SIZE);
		
		int readCounter = 0;
		int writeCounter = 0;
		char* readbufptr = NULL;
		
		/* read the file, and send it to the client in chunks of size PAYLOAD_SIZ */
		while((readCounter = fread(databuf,1, PAYLOAD_SIZE, filefd)) > 0)
		{
			writeCounter = 0;
			readbufptr = databuf;
			
			databuf[readCounter] = '\0';
			
			fill_header(seqnum, 0, readCounter, ACK, &packet);
			fill_packet((u_char*) &databuf[0], &packet, readCounter);
			/* calculate checksum */
			checksum = add_checksum(PACKET_SIZE, 0, (u_short*) &packet);
			packet.header.checksum = htons(checksum);
			
			//printf("Bytes sent: '%d' while readCounter '%d'\n", sizeof(packet), readCounter);
			
			/* Send the filecontents... */
		/* Send the filename... */
		send_results = tftp(sockfd, &packet, seqnum, 900000, ACK );
		if (send_results == -1) {
			fprintf(stderr, "Time out..\n");
			close(sockfd);
			return 2;
		} else if (send_results == -10) {
			printf("Received the final FIN.. Closing up shop.");
			fclose(filefd);
			close(sockfd);
			return 0;
		}	
		seqnum++;
			
			/* Re-Initialize the arrays to zeros */
			bzero(databuf, PAYLOAD_SIZE);
			bzero(packetbuf, PACKET_SIZE);
		}

			/* Re-Initialize the arrays to zeros */
			bzero(databuf, PAYLOAD_SIZE);
			bzero(packetbuf, PACKET_SIZE);
		
			/* Send the FIN */
			fill_header(seqnum, 0, readCounter, FIN, &packet);
			/* calculate checksum */
			checksum = add_checksum(PACKET_SIZE, 0, (u_short*) &packet);
			packet.header.checksum = htons(checksum);
			
		/* Send the filename... */
		send_results = tftp(sockfd, &packet, seqnum, 900000, FIN );
		if (send_results == -1) {
			fprintf(stderr, "Time out..\n");
			close(sockfd);
			return 2;
		} else if (send_results == -10) {
			printf("Received the final FIN.. Closing up shop.");
			fclose(filefd);
			close(sockfd);
			return 0;
		}	
		seqnum++;
		
		printf("Goodbye\n");
		freeaddrinfo(servinfo); // all done with this structure
    close(sockfd);
    return 0;
}
