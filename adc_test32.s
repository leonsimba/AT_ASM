# adc_test32.s - An example of using the ADC instruction
.section .data
data1:
	.quad 7252051615
data2:
	.quad 5732348928

.section .text
.globl _start
_start:
	nop
	movl data1, %edx
	movl data1+4, %ecx	# ecx:edx = 7252051615
	movl data2, %esi
	movl data2+4, %edi	# edi:esi = 5732348928

	addl %esi, %edx		# add low 32bit
	adcl %edi, %ecx		# add high 32bit and CF bit

	movl $1, %eax
	movl $0, %ebx
	int $0x80
