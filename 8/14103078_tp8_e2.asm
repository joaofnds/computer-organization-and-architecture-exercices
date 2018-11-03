.data
	 buffer: .space  0x10
	 length: .word   0x0f
	newline: .asciiz "\n"

.text

main:
		lui $s0, 0x1001 # start os data memory
		li  $s1, 10     # 10 used as a constant
		li  $s2, 1      # decimal place multiplier
		li  $s3, 0      # result acc

		li $v0, 8       # read string
		la $a0, buffer  # store result in buffer
		li $a1, 0x10    # 16 chars (including '\0')
		syscall

		la $t0, 0x10($s0) # start loop at the end of string
loop:
		blt $t0, $s0, exit    # if passed first char, exit
		nop

		lbu  $t1, 0($t0)      # load char

		blt $t1, 48, continue # continue if char < '0'
		nop
		bgt $t1, 57, continue # continue if char > '9'
		nop
		
		subi $t1, $t1, 48     # 48 = ASCII code for '0'
		
		mult $t1, $s2         # number *= decimal_acc
		mflo $t1
		mult $s2, $s1         # decimal_acc *= 10
		mflo $s2
		
		add $s3, $s3, $t1     # acc += new_number
continue:
		subi $t0, $t0, 1     # read next chart to the left

		j loop
		nop

exit:		
		li $v0, 1       # print result
		or $a0, $0, $s3
		syscall
		
		or $t0, $0, $s3 # store result in $t0

		li $v0, 0xa
		syscall