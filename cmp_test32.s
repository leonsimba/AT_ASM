# cmp_test32.s - An example of using the CMP and JGE instructions
.section .text
.globl _start
_start:
	nop
	movl $15, %eax
	movl $10, %ebx
	cmp %eax, %ebx
	jge greater		# if ebx - eax >=0, then jump to greater
	movl $1, %eax	# exit syscall
	int $0x80
greater:
	movl $20, %ebx  # set the parameter for exit(20)
	movl $1, %eax
	int $0x80
