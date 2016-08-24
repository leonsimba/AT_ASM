# size_test.s - A sample program to view the executable size
# as -o size_test.o size_test.s
# ld -o size_test size_test.o
# ls -l size_test

#.section .text
#.globl _start
#_start:
#	movl $1, %eax
#	movl $0, %ebx
#	int $0x80

#.section .bss
#	.lcomm buffer, 1000
#.section .text
#.globl _start
#_start:
#	movl $1, %eax
#	movl $0, %ebx
#	int $0x80

#.section .data
#buffer:
#	.fill 1000
#.section .text
#.globl _start
#_start:
#	movl $1, %eax
#	movl $0, %ebx
#	int $0x80
