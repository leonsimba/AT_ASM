# syscall_return.s - Retrieving system information via kernel system calls
#
# struct sysinfo {
# 	long uptime;             /* Seconds since boot */
# 	unsigned long loads[3];  /* 1, 5, and 15 minute load averages */
# 	unsigned long totalram;  /* Total usable main memory size */
# 	unsigned long freeram;   /* Available memory size */
# 	unsigned long sharedram; /* Amount of shared memory */
# 	unsigned long bufferram; /* Memory used by buffers */
# 	unsigned long totalswap; /* Total swap space size */
# 	unsigned long freeswap;  /* swap space still available */
# 	unsigned short procs;    /* Number of current processes */
# 	unsigned long totalhigh; /* Total high memory size */
# 	unsigned long freehigh;  /* Available high memory size */
# 	unsigned int mem_unit;   /* Memory unit size in bytes */
# 	char _f[20-2*sizeof(long)-sizeof(int)]; /* Padding for libc5 */
# };

.section .data
result:
uptime:
	.int 0
load1:
	.int 0
load5:
	.int 0
load15:
	.int 0
totalram:
	.int 0
freeram:
	.int 0
sharedram:
	.int 0
bufferram:
	.int 0
totalswap:
	.int 0
freeswap:
	.int 0
procs:
	.byte 0x00, 0x00
totalhigh:
	.int 0
freehigh:
	.int 0
mem_unit:
	.int 0

.section .bss
	.lcomm pid, 4

.section .text
.globl _start
_start:
	nop
	# pid_t getpid(void);
	movl $20, %eax
	int $0x80
	movl %eax, pid		# save the return value of getpid() to pid

	# int sysinfo(struct sysinfo *info);
	movl $result, %ebx	# use result to save struct sysinfo
	movl $116, %eax
	int $0x80

	# call syscall exit()
	movl $0, %ebx
	movl $1, %eax
	int $0x80
