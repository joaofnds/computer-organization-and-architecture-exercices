.text
	li $v0, 5
	syscall
	
	or $a0, $zero, $v0
	jal fib
	nop

	or $a0, $zero, $v0
	li $v0, 1
	syscall

	li $v0, 10
	syscall

fib:
	# store $ra in stack
	subi $sp, $sp, 4
	sw $ra, ($sp)

	subi $t0, $a0, 1
	ble	 $t0, $zero, f_return_1	# return_1 if $t0 <= 1

	subi $sp, $sp, 4
	sw $a0, ($sp)

	# fib(n-1)
	subi $a0, $a0, 1
	jal fib
	nop

	# replace $t0 with fib(n-2) in stack
	lw $t0, ($sp)
	sw $v0, ($sp)

	# fib(n-2)
	subi $a0, $t0, 2
	jal fib
	nop

	lw $t0, ($sp)
	addi $sp, $sp, 4
	add $v0, $t0, $v0

	f_return:
		lw $ra, ($sp)
		addi $sp, $sp, 4
		
		jr $ra
		nop

	f_return_1:
		li $v0, 1
		j f_return
		nop
