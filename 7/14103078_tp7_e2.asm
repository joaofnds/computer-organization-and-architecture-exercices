.data
			string: .asciiz "meu professor e o melhor"

.text
		   lui $t0, 0x1001
			 li  $t1, 0x20       # space char code
			 li  $t2, 1          # flag to indicate if it should capitalize the next word

loop:  lbu $t3, 0($t0)     # load char 

       beq $t3, $zero, end # if '\0', goto end
       nop

       beq $t3, $t1, space # if ' ', goto space
       nop
       
       beq $t2, 1, capit
       nop
       
       j continue
       nop


   space: li   $t2, 1         # set 'capitalize' flag to true
			    j continue
		      nop

   capit: sub  $t3, $t3, 32   # capitalize
			    sb   $t3, 0($t0)    # overwrite
			    li   $t2, 0         # set 'capitalize' flag to false

continue: addi $t0, $t0, 1
			    j loop
			    nop

end: sb $t3, 0($t0)
