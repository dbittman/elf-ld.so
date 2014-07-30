# makefile for ELF ld.so

SOURCES=src/main.c
OBJECTS=$(SOURCES:.c=.o)

-include make.inc

CFLAGS=-fpic -std=c99 -pedantic -Wall -Wextra
LDFLAGS=
OUTNAME=ld-elf.so

all: $(OUTNAME)

$(OUTNAME): $(OBJECTS)
	@echo " [LD] $(OUTNAME)"
	@$(CC) $(CFLAGS) $(LDFLAGS) -shared -o $(OUTNAME) $(OBJECTS)


clean:
	@-rm $(OBJECTS) $(OUTNAME)

.c.o:
	@echo " [CC] $@"
	@$(CC) $(CFLAGS) -c -o $@ $<

