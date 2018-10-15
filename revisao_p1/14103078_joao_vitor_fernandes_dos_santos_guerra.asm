.data
	op: .word 1
	 a: .word 2
	 b: .word 3
	 c: .word 4
	 
	 
.text

			lui $t0, 0x1001
			lw  $t1,  0($t0)  # op
			lw  $t2,  4($t0)  # a
			lw  $t3,  8($t0)  # b
			lw  $t4, 12($t0)  # c
			
			# $t5 is used for comparisons with op
			# $t6 is used to store the result

			beq $t1, $t5, op_0 # If op == 0, jump to op_0
			nop
			
			addi $t5, $t5, 1
			beq  $t1, $t5, op_1 # If op == 1, jump to op_1
			nop
			
			addi $t5, $t5, 1
			beq  $t1, $t5, op_2 # If op == 2, jump to op_2
			nop
			
			j exit
			nop

op_0: mult $t2, $t3 # a * b
			mflo $t6
			mult $t6, $t4 # (a * b) * c
			mflo $t6
			j exit
			nop

op_1: sll $t7, $t2, 1   # 2 * a
			sll $t6, $t2, 2   # 4 * a
			add $t6, $t6, $t7 # (2+4) * a
			add $t6, $t6, $t4 # 6a + c
			sll $t7, $t3, 1   # 2 * b
			sub $t6, $t6, $t7 # (6a + c) - 2b
			j exit
			nop

op_2: xori $t6, $t4, 0xAAAA
exit: sw $t6, 16($t0)












