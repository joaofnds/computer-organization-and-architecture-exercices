.data
	a: .half 30
	b: .half 5
	y: .space 4

.text
	      lui $t0, 0x1001
	      lh $t1, 0($t0)
	      lh $t2, 2($t0)
	
      	beq $t1, $t2, Else
       	nop
       	div  $t1, $t2
        j Exit
        nop
	Else: mult $t1, $t2
	Exit: mflo $t3
	      sw   $t3, 4($t0)
