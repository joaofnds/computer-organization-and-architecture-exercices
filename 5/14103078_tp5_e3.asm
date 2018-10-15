.data
	x: .word 7
	y: .space 4

.text
			  lui $t0, 0x1001
				lw  $t1, 0($t0)   # loop bound
				ori $t2, $zero, 0 # counter
				ori $t3, $zero, 1 # fib(0)
				ori $t4, $zero, 1 # fib(1)
				ori $t5, $zero, 0 # result

	Loop: addi $t2, $t2, 1     # counter += 1
	
	      beq  $t2, $t1, End   # if counter == loop bound, exit
	      nop

				add $t5, $t4, $t3    # fib n = fib(n-1) + fib(n-2)

				or $t3, $zero, $t4  # update last fib values
				or $t4, $zero, $t5
	      j Loop
	      nop
	 End: sw $t5, 4($t0)       # store result
