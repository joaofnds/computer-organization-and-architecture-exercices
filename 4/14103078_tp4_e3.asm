.data
	a: .word -3
	b: .word  7
	c: .word  5
	d: .word -2
	e: .word  8
	x: .word  4
	y: .space 4

.text
	lui $t0, 0x1001
	lw  $t1,  0($t0) # $t1 = a = -3
	lw  $t2,  4($t0) # $t2 = b =  7
	lw  $t3,  8($t0) # $t3 = c =  5
	lw  $t4, 12($t0) # $t4 = d = -2
	lw  $t5, 16($t0) # $t5 = e =  8
	lw  $t6, 20($t0) # $t7 = x =  4

	mult $t1, $t6
	mflo $t7           # $t7 = $t5 * t1

	add  $t7, $t7, $t2 # $t7 += $t2
	mult $t7, $t6      # $t7 *= $t6
	mflo $t7           # $t7  = ($t7 + $t2) * $t6

	add  $t7, $t7, $t3 # $t7 += $t3
	mult $t7, $t6      # $t7 *= $t6
	mflo $t7           # $t7  = ($t7 + $t3) * $t6

	add  $t7, $t7, $t4 # $t7 += $t4
	mult $t7, $t6      # $t7 *= $t6
	mflo $t7           # $t7  = ($t7 + $t4) * $t6

	add $t7, $t7, $t5  # $t7 += $t5

	sw $t7,  24($t0)   # Store result in 0x10010028(y)
