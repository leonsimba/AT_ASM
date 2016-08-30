# syscall_write.s - An example of passing input values to a system call
.section .data
output:
	.ascii "This is a test message.\n"
output_end:
	.equ LEN, output_end - output

.section .text
.globl _start
_start:
	movl $4, %eax		# write() syscall
	movl $1, %ebx		# output to stdout
	movl $output, %ecx
	movl $LEN, %edx
	int $0x80
	movl $1, %eax
	movl $0, %ebx
	int $0x80
