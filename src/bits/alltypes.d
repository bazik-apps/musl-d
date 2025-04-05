module musl.bits.alltypes;

version (AArch64) {
	import musl.aarch64.bits.types;
}
else version (ARM) {
	import musl.arm.bits.types;
}
else version (X86) {
	import musl.i386.bits.types;
}
else version (LoongArch64) {
	import musl.loongarch64.bits.types;
}
else version (M68K) {
	import musl.m68k.bits.types;
}
else version (MICROBLAZE) {
	import musl.microblaze.bits.types;
}
else version (MIPS32) {
	import musl.mips.bits.types;
}
else version (MIPS64) {
	import musl.mips64.bits.types;
}
else version (MIPS_N32) {
	import musl.mipsn32.bits.types;
}
else version (PPC) {
	import musl.powerpc.bits.types;
}
else version (PPC64) {
	import musl.powerpc64.bits.types;
}
else version (RISCV32) {
	import musl.riscv32.bits.types;
}
else version (RISCV32) {
	import musl.riscv64.bits.types;
}
else version (SystemZ) {
	import musl.s390x.bits.types;
}
else version (SH) {
	import musl.sh.bits.types;
}
else version (X32) {
	import musl.x32.bits.types;
}
else version (X86_64) {
	import musl.x86_64.bits.types;
}

extern (C):

alias wchar_t = dchar;

alias double_t = double;

alias uintptr_t = size_t;
alias ssize_t = ptrdiff_t;
alias intptr_t = ptrdiff_t;
alias regoff_t = ptrdiff_t;
alias time_t = long;
alias suseconds_t = long;

alias int8_t = byte;
alias int16_t = short;
alias int32_t = int;
alias int64_t = long;
alias intmax_t = long;
alias uint8_t = ubyte;
alias uint16_t = ushort;
alias uint32_t = uint;
alias uint64_t = ulong;
alias u_int64_t = ulong;
alias uintmax_t = ulong;

alias mode_t = uint;
alias off_t = long;
alias ino_t = ulong;
alias dev_t = ulong;
alias blkcnt_t = long;
alias fsblkcnt_t = ulong;
alias fsfilcnt_t = ulong;

alias wint_t = uint;
alias wctype_t = ulong;

alias timer_t = void*;
alias clockid_t = int;
alias clock_t = long;

struct timeval {
	time_t tv_sec;
	suseconds_t tv_usec;
}

struct timespec {
	time_t tv_sec;
	long tv_nsec;
}

alias pid_t = int;
alias id_t = uint;
alias uid_t = uint;
alias gid_t = uint;
alias key_t = int;
alias useconds_t = uint;

struct __pthread;
alias pthread_t = __pthread*;

alias pthread_once_t = int;
alias pthread_key_t = uint;
alias pthread_spinlock_t = int;

struct pthread_mutexattr_t {
	uint __attr;
}

struct pthread_condattr_t {
	uint __attr;
}

struct pthread_barrierattr_t {
	uint __attr;
}

struct pthread_rwlockattr_t {
	uint[2] __attr;
}

struct _IO_FILE;
alias FILE = _IO_FILE;

alias va_list = __builtin_va_list;
alias __isoc_va_list = __builtin_va_list;

struct mbstate_t {
	uint __opaque1, __opaque2;
}

struct __locale_struct;
alias locale_t = __locale_struct*;

struct sigset_t {
	ulong[long.sizeof] __bits;
}

struct iovec {
	void* iov_base;
	size_t iov_len;
}

struct winsize {
	ushort ws_row, ws_col, ws_xpixel, ws_ypixel;
}

alias socklen_t = uint;
alias sa_family_t = ushort;

struct pthread_attr_t {
	union __u {
		int[14] __i;
		shared int[14] __vi;
		ulong[7] __s;
	}
}

struct pthread_mutex_t {
	union __u {
		int[10] __i;
		shared int[10] __vi;
		shared pthread_t[5] __p;
	}
}

alias mtx_t = pthread_mutex_t;

struct pthread_cond_t {
	union __u {
		int[12] __i;
		shared int[12] __vi;
		pthread_t[48 / ptrdiff_t.sizeof] __p;
	}
}

alias cnd_t = pthread_cond_t;

struct pthread_rwlock_t {
	union __u {
		int[14] __i;
		shared int[14] __vi;
		pthread_t[7] __p;
	}
}

struct pthread_barrier_t {
	union __u {
		int[8] __i;
		shared int[8] __vi;
		pthread_t[4] __p;
	}
}
