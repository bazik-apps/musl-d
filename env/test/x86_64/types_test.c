#ifndef __LITTLE_ENDIAN_X86_64
#define __LITTLE_ENDIAN_X86_64 1234
#endif

#ifndef __BIG_ENDIAN_X86_64
#define __BIG_ENDIAN_X86_64 4321
#endif

#define __BYTE_ORDER_X86_64 __LITTLE_ENDIAN_X86_64
#define __LONG_MAX_X86_64 0x7fffffffffffffffL

typedef int wchar_t;

#if defined(__FLT_EVAL_METHOD__) && __FLT_EVAL_METHOD__ == 2
typedef long double float_t;
typedef long double double_t;
#else
typedef float float_t;
typedef double double_t;
#endif

typedef struct {
	long long __ll;
	long double __ld;
} max_align_aarch64_t;

#include <stdio.h>
#include <stddef.h>

int main() {
	printf("__BYTE_ORDER_X86_64: %d\n", __BYTE_ORDER_X86_64);
	printf("__LONG_MAX_X86_64: %ld\n", __LONG_MAX_X86_64);

	printf("Size of wchar_t: %zu\n", sizeof(wchar_t));
	printf("Size of float_t: %zu\n", sizeof(float_t));
	printf("Size of double_t: %zu\n", sizeof(double_t));

	printf("Size of max_align_t: %zu\n", sizeof(max_align_aarch64_t));
	printf("  __ll size: %zu\n", sizeof(((max_align_aarch64_t*)0)->__ll));
	printf("  __ll offset: %zu\n", offsetof(max_align_aarch64_t, __ll));
	printf("  __ld size: %zu\n", sizeof(((max_align_aarch64_t*)0)->__ld));
	printf("  __ld offset: %zu\n", offsetof(max_align_aarch64_t, __ld));

	return 0;
}
