module musl.arm.bits.types;

version (ARM) {
extern (C):

	alias register_t = ptrdiff_t;

	alias float_t = float;

	struct max_align_t {
		long __ll;
		double __ld;
	}

	alias blksize_t = ptrdiff_t;
	alias nlink_t = size_t;

	version = _REDIR_TIME64;
}
