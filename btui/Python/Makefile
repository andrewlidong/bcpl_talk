PREFIX=
CC ?= gcc
O ?= -O2
CFLAGS=-std=c99 -D_XOPEN_SOURCE=500 -D_GNU_SOURCE -D_POSIX_C_SOURCE=200809L
CWARN=-Wall -Wpedantic -Wextra \
	-Wsign-conversion -Wtype-limits -Wnull-dereference \
	-Waggregate-return -Walloca \
	-Wdangling-else -Wdate-time -Wdisabled-optimization -Wdouble-promotion \
	-Wfloat-conversion -Wfloat-equal -Wformat-nonliteral \
	-Wformat-security -Wframe-address -Winline -Winvalid-pch \
	-Wlong-long -Wmissing-format-attribute -Wmissing-include-dirs -Wmissing-noreturn \
	-Wnull-dereference -Woverlength-strings -Wpacked -Wpointer-arith \
	-Wredundant-decls -Wshadow \
	-Wsign-conversion -Wstack-protector -Wswitch-default -Wswitch-enum \
	-Wundef -Wunused -Wunused-but-set-variable \
	-Wunused-const-variable -Wunused-local-typedefs -Wvariadic-macros \
	-Wvla -Wwrite-strings
#CFLAGS += -fsanitize=address -fno-omit-frame-pointer

ifeq ($(shell uname -s),Darwin)
	CFLAGS += -D_DARWIN_C_SOURCE
	LIBNAME = libbtui.dylib
else
	LIBNAME = libbtui.so
endif
G=

all: $(LIBNAME)

clean:
	rm -f btui.o libbtui.so libbtui.dylib

$(LIBNAME): btui.o
	$(CC) $(CFLAGS) $(CWARN) $(G) $(O) -shared $< -o $@

btui.o: btui.c ../btui.h
	$(CC) $(CFLAGS) $(CWARN) $(G) $(O) -fPIC -c $< -o $@

test: $(LIBNAME)
	python3 test.py

.PHONY: all, clean, test
