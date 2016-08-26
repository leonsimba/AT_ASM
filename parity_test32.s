# parity_test32.s - An example of testing the parity flag bit
.section .text
.globl _start
_start:
	nop				# for gdb debug
	movl $1, %eax
	movl $4, %ebx
	subl $3, %ebx	# the result is 0x00000001
	jp overhere
	int $0x80
overhere:
	movl $100, %ebx
	int $0x80
