.PHONY: all clean install
all: client server

include ../../logging.mk
include ../../build_env.mk

client: checksum.o header.o
	$(CC) client.c checksum.o header.o -o client

server: checksum.o header.o
	$(CC) server.c checksum.o header.o -o server

clean:
	rm -f *.o client server
