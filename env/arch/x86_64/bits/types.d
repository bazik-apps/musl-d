module musl.x86_64.bits.types;

version (X86_64) {
extern (C):

	enum __LITTLE_ENDIAN = 1234;
	enum __BIG_ENDIAN = 4321;

	enum __BYTE_ORDER = __LITTLE_ENDIAN;

	enum __LONG_MAX = 0x7fffffffffffffffL;

	alias wchar_t = dchar;

	version (__FLT_EVAL_METHOD__2) {
		alias float_t = real;
		alias double_t = real;
	}
	else {
		alias float_t = float;
		alias double_t = double;
	}

	struct max_align_t {
		long __ll;
		real __ld;
	}

	import util.attributes: betterC;

	@betterC @safe pure nothrow unittest {
		static assert(__BYTE_ORDER == 1234);
		static assert(__LONG_MAX == 0x7fffffffffffffffL);

		static assert(is(wchar_t == dchar));

		static assert(__traits(isPOD, max_align_t));
		static assert(typeof(max_align_t.__ll).sizeof == 8);
		static assert(max_align_t.__ll.offsetof == 0);
		static assert(typeof(max_align_t.__ld).sizeof == 16);
		static assert(max_align_t.__ld.offsetof == 16);
		static assert(max_align_t.sizeof == 32);
	}
}
