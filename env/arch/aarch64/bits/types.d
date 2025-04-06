module musl.aarch64.bits.types;

version (AArch64) {
extern (C):

	enum __LITTLE_ENDIAN = 1234;
	enum __BIG_ENDIAN = 4321;

	version (__AARCH64EB__) {
		enum __BYTE_ORDER = __BIG_ENDIAN;
	}
	else {
		enum __BYTE_ORDER = __LITTLE_ENDIAN;
	}

	enum __LONG_MAX = 0x7fffffffffffffffL;

	alias wchar_t = dchar;
	alias wint_t = dchar;

	alias float_t = float;
	alias double_t = double;

	extern (C) struct max_align_t {
		long __ll;
		real __ld;
	}

	alias blksize_t = int;
	alias nlink_t = uint;

	import util.attributes: betterC;

	@betterC @safe pure nothrow unittest {
		static assert(__BYTE_ORDER == 1234);
		static assert(__LONG_MAX == 0x7fffffffffffffffL);

		static assert(is(wchar_t == dchar));
		static assert(is(wint_t == dchar));

		static assert(__traits(isPOD, max_align_t));
		static assert(typeof(max_align_t.__ll).sizeof == 8);
		static assert(max_align_t.__ll.offsetof == 0);
		static assert(typeof(max_align_t.__ld).sizeof == 16);
		static assert(max_align_t.__ld.offsetof == 0);
		static assert(max_align_t.sizeof == 32);

		static assert(is(blksize_t == int));
		static assert(is(nlink_t == uint));
	}
}
