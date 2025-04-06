#ifndef __LITTLE_ENDIAN_AARCH64
#define __LITTLE_ENDIAN_AARCH64 1234
#endif

#ifndef __BIG_ENDIAN_AARCH64
#define __BIG_ENDIAN_AARCH64 4321
#endif

#if __AARCH64EB__
#define __BYTE_ORDER_AARCH64 __BIG_ENDIAN_AARCH64
#else
#define __BYTE_ORDER_AARCH64 __LITTLE_ENDIAN_AARCH64
#endif

#define __LONG_MAX_AARCH64 0x7fffffffffffffffL

typedef unsigned wchar_t;
typedef unsigned wint_t;

typedef int blksize_t;
typedef unsigned int nlink_t;

typedef float float_t;
typedef double double_t;

typedef struct {
	long long __ll;
	long double __ld;
} max_align_aarch64_t;

#define __HAVE_FLOAT128 0
#include <stdio.h>
#include <stddef.h>

int main() {
	printf("__BYTE_ORDER_AARCH64: %d\n", __BYTE_ORDER_AARCH64);
	printf("__LONG_MAX_AARCH64: %ld\n", __LONG_MAX_AARCH64);

	printf("Size of wchar_t: %zu\n", sizeof(wchar_t));
	printf("Size of wint_t: %zu\n", sizeof(wint_t));
	printf("Size of blksize_t: %zu\n", sizeof(blksize_t));
	printf("Size of nlink_t: %zu\n", sizeof(nlink_t));
	printf("Size of float_t: %zu\n", sizeof(float_t));
	printf("Size of double_t: %zu\n", sizeof(double_t));

	printf("Size of max_align_t: %zu\n", sizeof(max_align_aarch64_t));
	printf("  __ll size: %zu\n", sizeof(((max_align_aarch64_t*)0)->__ll));
	printf("  __ll offset: %zu\n", offsetof(max_align_aarch64_t, __ll));
	printf("  __ld size: %zu\n", sizeof(((max_align_aarch64_t*)0)->__ld));
	printf("  __ld offset: %zu\n", offsetof(max_align_aarch64_t, __ld));

	return 0;
}
