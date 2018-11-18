.text
	li $t0, 10

	or $a0, $0, $t0
	jal factorial
	nop

	or $t1, $0, $v0

	li $v0, 10
	syscall

factorial:
	# return 1 if $a0 <= 1
	subi $t0, $a0, 1
	blez $t0, return_1
	nop

	# push($ra)
	subi $sp, $sp, 4
	sw $ra, ($sp)

	# push($a0)
	subi $sp, $sp, 4
	sw $a0, ($sp)

	# $v0 = factorial(n-1)
	subi $a0, $a0, 1
	jal factorial
	nop

	# $t0 = pop() // get original argument
	lw $t0, ($sp)
	addi $sp, $sp, 4

	# n * factorial(n-1)
	mult $t0, $v0
	mflo $v0

	# $ra = pop()
	lw $ra, ($sp)
	addi $sp, $sp, 4

	return:
		jr $ra
		nop
	
	return_1:
		li $v0, 1
		j return
		nop
