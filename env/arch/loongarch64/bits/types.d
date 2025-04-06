module musl.loongarch64.bits.types;

extern (C):

version (LoongArch64) {
	alias register_t = ptrdiff_t;

	alias float_t = float;

	struct max_align_t {
		long __ll;
		double __ld;
	}

	alias blksize_t = int;
	alias nlink_t = uint;
}
