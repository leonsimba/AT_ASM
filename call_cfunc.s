# call_cfunc.s - An example of using C functions
.section .data
output:
	.asciz	"This is a test, %s\n"
msg:
	.ascii	"hello world"

.section .text
.globl _start
_start:
	movl $10, %ecx
loop1:
	pushl %ecx		# save ecx

	# call printf()
	pushl $msg		# push first parameter
	pushl $output	# push second parameter
	call printf
	addl $8, %esp	# pop parameters

	# call sleep()
	pushl $5		# push parameter
	call sleep
	addl $4, %esp	# pop parameter

	popl %ecx		# recover ecx for loop
	loop loop1

	pushl $0
	call exit
