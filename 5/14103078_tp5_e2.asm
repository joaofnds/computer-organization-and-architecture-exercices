.data
	y: .space 4

.text
			  lui $t0, 0x1001
			  ori $t1, $zero, 333
			  ori $t2, $zero, 0    # counter
			  ori $t3, $zero, 0    # acc

	Loop: addi $t2, $t2, 1     # counter += 1
				add $t3, $t3, $t2    # acc += counter
			  beq  $t1, $t2, End   # if counter == 333, exit
			  nop
				j Loop
				nop
	 End: sw $t3, 0($t0)       # store acc
