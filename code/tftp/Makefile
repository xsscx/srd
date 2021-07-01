.PHONY: all clean install
all: S3_6_c15_c1_5

include ../../logging.mk
include ../../build_env.mk

CC = gcc

all: client server

again: clean client server

client: checksum.o header.o
	$(CC) client.c checksum.o header.o -o client

server: checksum.o header.o
	$(CC) server.c checksum.o header.o -o server

clean:
	rm -f *.o client server
