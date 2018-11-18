.text
			li $t0, 150
			li $t1, 230
			li $t2, 991
			li $t3, 0
			
			or $a0, $0, $t0
			or $a1, $0, $t1
			or $a2, $0, $t2
			
			jal soma3n
			nop
			
			or $t3, $0, $v0

			li $v0, 10
			syscall

soma3n:
			# push $ra
			subi $sp, $sp, 4
			sw $ra, ($sp)

			# sum($a0, $a1)
			jal soma
			nop

			# sum(sum($a0, $a1), $a2)
			or $a0, $0, $v0 # $v0 = sum($a0, $a1)
			or $a1, $0, $a2

			jal soma
			nop


			# pop $ra and return
			lw $ra, ($sp)
			addi $sp, $sp, 4
			jr $ra
			nop
soma:
			add $v0, $a0, $a1
			jr $ra
			nop

