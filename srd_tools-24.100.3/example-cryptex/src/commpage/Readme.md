# Read the commpage on SRD

Dumps the content of a 64-bit comm page on SRD.

### Sample Session
```
./commpage64
# uname -a
Darwin SRD0009 21.4.0 CopyPasta Kernel Cache 21.4.0: Mon Feb 21 21:27:53 PST 2022; root:xnu-8020.102.3~1/RELEASE_ARM64_T8030 iPhone12,1 Toybox
# commpage
[*] COMM_PAGE_SIGNATURE: commpage 64-bit
[*] COMM_PAGE_VERSION: 3
[*] COMM_PAGE_NCPUS: 6
[*] COMM_PAGE_CACHE_LINESIZE: 128
[*] COMM_PAGE_SCHED_GEN: 0
[*] COMM_PAGE_MEMORY_PRESSURE: 0
[*] COMM_PAGE_SPIN_COUNT: 0
[*] COMM_PAGE_KDEBUG_ENABLE: 0
[*] COMM_PAGE_ATM_DIAGNOSTIC_CONFIG: 0
[*] COMM_PAGE_BOOTTIME_USEC: 1
[*] COMM_PAGE_ACTIVE_CPUS: 6
[*] COMM_PAGE_PHYSICAL_CPUS: 6
[*] COMM_PAGE_LOGICAL_CPUS: 6
[*] COMM_PAGE_MEMORY_SIZE: 4036837376
[*] COMM_PAGE_CPUFAMILY: 0
[*] COMM_PAGE_CPU_CAPABILITIES64:
	MMX: false
	SSE: false
	SSE2: false
	SSE3: true
	Cache32: false
	Cache64: false
	Cache128: true
	FastThreadLocalStorage: true
	SupplementalSSE3: true
	64Bit: true
	SSE4_1: true
	SSE4_2: true
	AES: true
	InOrderPipeline: true
	Slow: true
	UP: false
	NumCPUs: 6
	AVX1_0: true
	RDRAND: true
	F16C: true
	ENFSTRG: true
	FMA: false
	AVX2_0: false
	BMI1: false
	BMI2: true
	RTM: true
	HLE: true
	ADX: false
	RDSEED: false
	MPX: false
	SGX: false
[*] Done dumping comm page.
```
