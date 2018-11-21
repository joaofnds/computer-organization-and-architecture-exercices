.text
main:
	lui $s0, 0x1001 # memory pointer

	# $s1 = read_int
	li $v0, 5
	syscall
	or $s1, $zero, $v0

	# memory_pointer = read_vector(memory_pointer, vector_size)
	or $a0, $zero, $s0
	or $a1, $zero, $s1
	jal read_vector
	nop
	or $s0, $zero, $v0 # add offset to memory pointer

	# print(0x10010000, memory_pointer)
	or $a0, $zero, $zero
	lui $a0, 0x1001
	or $a1, $zero, $s0
	jal sum_even
	nop

	or $a0, $zero, $v0
	li $v0, 1
	syscall

	li $v0, 10
	syscall

# read_vector reads $a1 integers and store them starting at $a0,
# returning a pointer to the next memory position
read_vector:
	or $t0, $zero, $a0 # store memory pointer in $t0
	or $t1, $zero, $a1 # store vector size in $t1

	rv_loop:
		beq $t1, $zero, rv_return # exit if $t1 == 0
		nop

		li $v0, 5 # read int
		syscall

		sw $v0, ($t0) # store read int in $a0 address

		addi $t0, $t0, 4 # increment memory pointer
		subi $t1, $t1, 1 # decrement vector size

		j rv_loop
		nop

	rv_return:
		or $v0, $zero, $t0
		jr $ra
		nop

sum_even:
	or $t0, $zero, $a0 # start
	or $t1, $zero, $a1 # end
	li $t2, 2 # use to get remainder
	li $t4, 0 # sum accumulator

	p_loop:
		bge $t0, $t1, p_return # exit if start == end

		lw $a0, ($t0)

		rem $t3, $a0, $t2

		bne $t3, $zero, continue
		nop

		add $t4, $t4, $a0

		continue:
			addi $t0, $t0, 4 # $t0 += 4

			j p_loop
			nop

	p_return:
		or $v0, $zero, $t4
		jr $ra
		nop
