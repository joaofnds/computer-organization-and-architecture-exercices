.data
			vector: .word 1,2,3,4,5,6,7,8,9,10

.text
				li  $t0, 0x1    # order flag
				lui $t1, 0x1001 # momory pointer
				li  $t2, 0x9    # loop counter

  loop: beq $t2, $zero, end

				lw $t3, 0($t1)
				lw $t4, 4($t1)

				bgt $t3, $t4, flag_0
				nop

				addi $t1, $t1, 4
				subi $t2, $t2, 1
				j loop
				nop

flag_0: li $t0, 0
   end: nop
