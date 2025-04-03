#!/bin/sh

TOOLS_DIR="$(dirname "$(realpath "$0")")"
ARCH_DIR="$(dirname "${TOOLS_DIR}")/arch"
INCLUDE_DIR="$(dirname "${TOOLS_DIR}")/include"

for arch in "${ARCH_DIR}"/*; do
	sed -f "${TOOLS_DIR}/mkalltypes.sed" "${arch}/bits/alltypes.h.in" > "${arch}/bits/alltypes.h"
	cp -Tf "${arch}/bits/syscall.h.in" "${arch}/bits/syscall.h" &&
		sed -n -e s/__NR_/SYS_/p < "${arch}/bits/syscall.h.in" >> "${arch}/bits/syscall.h"
done

sed -f "${TOOLS_DIR}/mkalltypes.sed" "${INCLUDE_DIR}/alltypes.h.in" > "${INCLUDE_DIR}/alltypes.h"
