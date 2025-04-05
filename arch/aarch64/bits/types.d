module musl.aarch64.bits.types;

version (AArch64) {
extern (C):

	enum __LITTLE_ENDIAN = 1234;
	enum __BIG_ENDIAN = 4321;
	enum __USE_TIME_BITS64 = 1;

	version (__AARCH64EB__) {
		enum __BYTE_ORDER = __BIG_ENDIAN;
	}
	else {
		enum __BYTE_ORDER = __LITTLE_ENDIAN;
	}

	enum __LONG_MAX = 0x7fffffffffffffffL;

	alias register_t = ptrdiff_t;

	alias float_t = float;

	struct max_align_t {
		long __ll;
		double __ld;
	}

	alias blksize_t = int;
	alias nlink_t = uint;
}
