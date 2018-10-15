.data
 	 tamanho: .word 7
	  vetor1: .word -30, -23, 56, -43,  72, -18, 71
		vetor2: .word  45,  23, 21, -23, -82,   0, 69
			soma: .word   0,   0,  0,   0,   0,   0,  0

.text
				lw $t0, tamanho
				la $t1, vetor1
				la $t2, vetor2
				la $t3, soma

  loop: beq $t0, $zero, end
  
				lw  $t4, 0($t1)
				lw  $t5, 0($t2)

				add $t6, $t5, $t4
				sw  $t6, 0($t3)

				subi $t0, $t0, 1
				addi $t1, $t1, 4
				addi $t2, $t2, 4
				addi $t3, $t3, 4

				j loop
				nop
	 end: nop
