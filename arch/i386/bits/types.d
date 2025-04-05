module musl.i386.bits.types;

extern (C):

version (X86) {
	alias register_t = ptrdiff_t;

	version (FLT_EVAL_METHOD_0) {
		alias float_t = float;
	}
	else {
		alias float_t = double;
	}

	struct max_align_t {
		align(8) long __ll;
		double __ld;
	}

	alias blksize_t = long;
	alias nlink_t = size_t;

	version = _REDIR_TIME64;
}
