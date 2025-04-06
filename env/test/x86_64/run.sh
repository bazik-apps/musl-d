#!/bin/sh

clang -v \
	-target x86_64-linux-musl \
	--sysroot=/usr/lib/musl \
	-I/usr/lib/musl/include \
	-fuse-ld=lld \
	-nostdinc \
	-nostdlib \
	-o types_test \
	types_test.c

# clang -I/path/to/musl/include \
# 	-L/path/to/musl/lib \
# 	-nostdinc \
# 	-nostdlib \
# 	-lm file.c -o output
