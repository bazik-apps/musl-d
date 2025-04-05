module musl.m68k.bits.types;

extern (C):

version (M68K) {
	alias register_t = ptrdiff_t;

	version (__mcffpu__) {
		alias float_t = float;
	}
	else {
		alias float_t = double;
	}

	struct max_align_t {
		long __ll;
		double __ld;
	}

	alias blksize_t = ptrdiff_t;
	alias nlink_t = size_t;

	version = _REDIR_TIME64;
}
