# y = 32ab - 3a + 7b - 13

.data
	a: .word 3
	b: .word 5
	y: .space 4
	
.text
	lui $t0, 0x1001 # Set $t0 to the first data memory address
	lw  $t1, 0($t0) # Load "3"(a) in $t1
	lw  $t2, 4($t0) # Load "5"(b) in $t2
	
	mult $t1, $t2    # a*b
	mflo $t3         # Move result on $t3
	sll  $t3, $t3, 5 # 32*a*b

	ori  $t4, $zero, 3   # $t4 = 3
	mult $t4, $t1        # $t4 * a (3*a)
	mflo $t4             # Move result on $t4
	
	ori  $t5, $zero, 7 # $t5 = 7
	mult $t5, $t2      # $t5 * $t2 (7*b)
	mflo $t5           # Store result on $t5
	
	sub $t3, $t3, $t4   # 32ab - 3a
	add $t3, $t3, $t5   # (32ab - 3a) + 7b
	ori $t4, $zero, 13
	sub $t3, $t3, $t4   # (32ab - 3a + 7b) - 13
	
	sw $t3, 8($t0) # Store equation result in 0x10010008(y)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
