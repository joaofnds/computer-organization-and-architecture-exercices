.data
	vector_size: .word 5

.text
main:
	lui $s0, 0x1001 # memory pointer
	lw  $s1, vector_size

	# memory_pointer = read_vector(memory_pointer, vector_size)
	or $a0, $zero, $s0
	or $a1, $zero, $s1
	jal read_vector
	nop
	or $s0, $zero, $v0 # add offset to memory pointer

	# memory_pointer = read_vector(memory_pointer, vector_size)
	or $a0, $zero, $s0
	or $a1, $zero, $s1
	jal read_vector
	nop
	or $s0, $zero, $v0 # add offset to memory pointer

	or $a0, $zero, $zero
	lui $a0, 0x1001
	or $a1, $zero, $s0
	jal print
	nop

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

print:
	or $t0, $zero, $a0 # start
	or $t1, $zero, $a1 # end

	p_loop:
		bge $t0, $t1, p_return # exit if start == end

		# print(*$a0)
		lw $a0, ($t0)
		li $v0, 1
		syscall

		addi $t0, $t0, 4 # $t0 += 4

		j p_loop
		nop

	p_return:
		jr $ra
		nop
