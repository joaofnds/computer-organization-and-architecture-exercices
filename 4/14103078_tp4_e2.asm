# y = 9a^3 - 5a^2 + 7a + 15
# Horner's method's sequence: [9, -5, 6, 15]

.data
	a:    .word  3
	y:    .space 4
	
	# Store Horder's method's sequence
	seq1: .word  9
	seq2: .word -5
	seq3: .word  6
	seq4: .word  15

.text
	lui $t0, 0x1001
	lw $t1,  0($t0)  # $t1 = 3
	lw $t2,  8($t0)  # $t2 = 9
	lw $t3,  12($t0) # $t3 = -5
	lw $t4,  16($t0) # $t4 = 6
	lw $t5,  20($t0) # $t4 = 15

	mult $t2, $t1
	mflo $t6         # $t6 = 9 * 3

	add  $t6, $t6, $t3
	mult $t6, $t1
	mflo $t6           # $t6 = $t6 + $t3 * $t1

	add $t6,  $t6, $t4
	mult $t6, $t1
	mflo $t6           # $t6 = $t6 + $t3 * $t2

	add $t6, $t6, $t5  # $t6 = $t6 + $t5
	
	sw $t6, 4($t0)     # Store the result in 0x10010004(y)