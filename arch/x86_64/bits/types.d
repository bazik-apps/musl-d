module musl.x86_64.bits.types;

extern (C):

version (X86_64) {
	alias register_t = ptrdiff_t;

	version (FLT_EVAL_METHOD_2) {
		alias float_t = double;
	}
	else {
		alias float_t = float;
	}

	struct max_align_t {
		long __ll;
		double __ld;
	}

	alias blksize_t = long;
	alias nlink_t = size_t;
}
