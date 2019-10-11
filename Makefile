CC = gcc
CFLAGS = -std=c99 -Wall -Wextra -O3 -pthread
INCLUDES =
LDFLAGS =
LIBS = -luv
SRCS = netutils.c dns2tcp.c
OBJS = $(SRCS:.c=.o)
MAIN = dns2tcp
DESTDIR = /usr/local/bin

.PHONY: all install clean

all: $(MAIN)

install: $(MAIN)
	mkdir -p $(DESTDIR)
	install -m 0755 $(MAIN) $(DESTDIR)

clean:
	$(RM) *.o $(MAIN)

$(MAIN): $(OBJS) 
	$(CC) $(CFLAGS) $(INCLUDES) -s -o $(MAIN) $(OBJS) $(LDFLAGS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@
