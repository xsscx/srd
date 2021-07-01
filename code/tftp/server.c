/*
 * project:       tftp server program
 * author:        Oscar Sanchez (oms1005@gmail.com)
 * description:   a small tftp (trivial ftp) server program
*/
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/wait.h>
#include <signal.h>
#include <stdarg.h>
#include <assert.h>
#include <fcntl.h>
#include "header.h"
#include "checksum.h"

#define BACKLOG 10     // how many pending connections queue will hold


void sigchld_handler(int s)
{
    while(waitpid(-1, NULL, WNOHANG) > 0);
}

// get sockaddr, IPv4 or IPv6:
void *get_in_addr(struct sockaddr *sa)
{
    if (sa->sa_family == AF_INET) {
        return &(((struct sockaddr_in*)sa)->sin_addr);
    }

    return &(((struct sockaddr_in6*)sa)->sin6_addr);
}

int main(int argc, char**argv)
{

    int port = 69;
    char ch;
	  /* Read command line options */
	  while ((ch = getopt(argc, argv, "p:")) != -1) {
	    switch (ch) {
			case 'p':
				port = atoi(optarg);
				break;
	    case '?':
	      printf("Usage: ./server [-p port]\n");
	      exit(1);
	    }
	  }
    char PORT[10];
    sprintf(PORT,"%d",port);
    
    int sockfd, new_fd;  // listen on sock_fd, new connection on new_fd
    struct addrinfo hints, *servinfo, *p;
    struct sockaddr_storage their_addr; // connector's address information
    socklen_t sin_size;
    struct sigaction sa;
    int yes=1;
    char s[INET6_ADDRSTRLEN];
    int rv;

    memset(&hints, 0, sizeof hints);
    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_flags = AI_PASSIVE; // use my IP

    if ((rv = getaddrinfo(NULL, PORT, &hints, &servinfo)) != 0) {
        fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(rv));
        return 1;
    }

    // loop through all the results and bind to the first we can
    for(p = servinfo; p != NULL; p = p->ai_next) {
        if ((sockfd = socket(p->ai_family, p->ai_socktype,
                p->ai_protocol)) == -1) {
            perror("server: socket");
            continue;
        }

        if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &yes,
                sizeof(int)) == -1) {
            perror("setsockopt");
            exit(1);
        }

        if (bind(sockfd, p->ai_addr, p->ai_addrlen) == -1) {
            close(sockfd);
            perror("server: bind");
            continue;
        }

        break;
    }

    if (p == NULL)  {
        fprintf(stderr, "server: failed to bind\n");
        return 2;
    }

    freeaddrinfo(servinfo); // all done with this structure

    if (listen(sockfd, BACKLOG) == -1) {
        perror("listen");
        exit(1);
    }

    sa.sa_handler = sigchld_handler; // reap all dead processes
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = SA_RESTART;
    if (sigaction(SIGCHLD, &sa, NULL) == -1) {
        perror("sigaction");
        exit(1);
    }

    printf("server: waiting for connections...\n");

    while(1) {  // main accept() loop
        sin_size = sizeof their_addr;
        new_fd = accept(sockfd, (struct sockaddr *)&their_addr, &sin_size);
        if (new_fd == -1) {
            perror("accept");
            continue;
        }

        inet_ntop(their_addr.ss_family,
            get_in_addr((struct sockaddr *)&their_addr),
            s, sizeof s);
        printf("server: got connection from %s\n", s);

        if (!fork()) { // this is the child process
            close(sockfd); // child doesn't need the listener

						/* Set Socket to non blocking */
						//fcntl(new_fd, F_SETFL, O_NONBLOCK);
						char buf[PACKET_SIZE];
						char databuf[PAYLOAD_SIZE];
						int numbytes, ack_bytes;
						header_t head;
						packet_t packet;
						packet_t ackr;
						//char recved[PACKET_SIZE];
						int getfilename = 1;
						char *filename = (char*) "recvfile.txt";

						FILE * filefd;

						/* Zero the arrays */
						bzero(buf, PACKET_SIZE);
						bzero(databuf, PAYLOAD_SIZE);

						while(getfilename) {
							if ((numbytes = recv(new_fd, buf, PACKET_SIZE, 0)) == -1) {
								perror("recv");
								exit(1);
							}							
							/* We have a packet with filename! */
							if(numbytes > 0)
							{
								read_header(&head, (packet_t *)buf);
								read_packet((u_char*) databuf, (packet_t *)buf, (u_short) (numbytes - HEADER_SIZE));
								printf("Packet '%d' received\n", (int)(head.seq));

								if(add_checksum(numbytes, numbytes%2, (u_short *)buf) == 0) {
									printf("Checksum OK\n");
									/* Create ACK to send back with sequence number */
									fill_header((int)(head.seq), 0, HEADER_SIZE, ACK, &ackr);

									printf("Filename: '%s' bytes '%d'\n", databuf, numbytes);

									if((ack_bytes = send(new_fd, &ackr, HEADER_SIZE, 0)) == -1) {
										perror("send: ack");
										exit(1);
									} else {
										printf("ACK '%d' sent\n", (int)(head.seq));
										getfilename = 0;
									}

								} else {
									printf("Checksum failed, discarding packet...\n");
								}
							}						
						} /* END first while for filename */


						//filefd = open(argv[3], O_WRONLY | O_CREAT | O_APPEND);

				    if ( (filefd = fopen(filename, "w")) == NULL)
				    {
				        fprintf(stderr, "Could not open destination file, using stdout.\n");
				    } else {
								printf("Preparing to start writing file '%s'\n", filename );
						}


						int recvFIN = 0;
						/* re-zero array */
						bzero(buf, PACKET_SIZE);
						bzero(databuf, PAYLOAD_SIZE);

						/* read the file from the socket as long as there is data */ 

				    do {

								if ((numbytes = recv(new_fd, buf, PACKET_SIZE, 0)) == -1) {
									perror("recv");
									fclose(filefd);
			            close(new_fd);
									exit(1);
								}

								read_header(&head, (packet_t *)buf);

								if((int)head.flag == ACK)
								{
									read_packet((u_char*) databuf, (packet_t *)buf, (u_short) (numbytes - HEADER_SIZE));

									printf("Packet '%d' received with '%d' bytes with an offset of '%d'\n", (int)(head.seq), numbytes, (int)(head.offset));

									if(add_checksum(numbytes, numbytes%2, (u_short *)buf) == 0) {
										printf("Checksum OK\n");
										/* Create ACK to send back with sequence number */
										fill_header((int)(head.seq), 0, HEADER_SIZE, ACK, &ackr);


										if((ack_bytes = send(new_fd, &ackr, HEADER_SIZE, 0)) == -1) {
											perror("send: ack");
											exit(1);
										} else {
											printf("ACK '%d' sent\n", (int)(head.seq));
											/* write to file */
											fwrite(databuf,1 , (int)(head.offset) ,filefd );
										}

									} else {
										printf("Checksum failed, discarding packet...\n");
									}
								}	else if ((int)head.flag == FIN) {
									printf("FIN received...\n");
									/* Create FIN to send back with sequence number */
									fill_header((int)(head.seq), 0, HEADER_SIZE, FIN, &ackr);
									if((ack_bytes = send(new_fd, &ackr, HEADER_SIZE, 0)) == -1) {
										perror("send: ack");
										exit(1);
									} else {
										printf("FIN '%d' sent\n", (int)(head.seq));
										recvFIN = 1;
									}
								}
								//else if ((int)head.flag == FIN) {
								/* re-zero */
								bzero(buf, PACKET_SIZE);
								bzero(databuf, PAYLOAD_SIZE);
							} while (!recvFIN );
						printf("Done...\n");

						fclose(filefd);
            close(new_fd);
            exit(0);
        }
        close(new_fd);  // parent doesn't need this
    }
    return 0;
}
