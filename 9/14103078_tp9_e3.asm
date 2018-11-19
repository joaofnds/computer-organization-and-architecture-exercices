.data
	prompt_calc_type: .asciiz "\n0 - circulo (PI*r^2)\n1 - triangulo (b*a/2)\n2 - retangulo (b*a)\nQual area deseja calcular? "
	prompt_a: .asciiz "a = "
	prompt_b: .asciiz "b = "
	prompt_r: .asciiz "r = "
	display_result: .asciiz "area = "
	pi_suffix: .asciiz "PI"

.text
	# print(question_string)
	la $a0, prompt_calc_type
	jal prompt
	nop

	# calculate circle area if user input is 0
	beq $v0, $zero, calc_circle
	nop

	# calculate trangle area if user input is 1
	li $t0, 1
	beq $v0, $t0, calc_triangle
	nop
	
	# calculate rectangle area if user input is 2
	li $t0, 2
	beq $v0, $t0, calc_rectangle
	nop
	
	show_and_end:
		or $t0, $zero, $v0

		# print display_result string
		la $a0, display_result
		li $v0, 4
		syscall

		# print result
		or $a0, $zero, $t0
		li $v0, 1
		syscall

	end:
		li $v0, 10
		syscall


calc_circle:
	# prompt user for radius
	la $a0, prompt_r
	jal prompt
	nop

	# store radius value in $t0
	or $t0, $zero, $v0
	
	# square radius
	mult $t0, $t0
	
	# print result string
	la $a0, display_result
	li $v0, 4
	syscall
	
	# print redius squared
	mflo $a0
	li $v0, 1
	syscall
	
	# print "PI" suffix
	la $a0, pi_suffix
	li $v0, 4
	syscall

	j end
	nop


calc_triangle:
	# prompt user for `a`
	la $a0, prompt_a
	jal prompt
	nop

	# store user input in $t0
	or $t0, $zero, $v0

	# prompt user for `b`
	la $a0, prompt_b
	jal prompt
	nop

	# store user input in $t1
	or $t1, $zero, $v0
	
	# a * b / 2
	mult $t0, $t1
	mflo $v0
	srl $v0, $v0, 1

	j show_and_end
	nop


calc_rectangle:
	# prompt user for `a`
	la $a0, prompt_a
	jal prompt
	nop

	# store user input in $t0
	or $t0, $zero, $v0

	# prompt user for `b`
	la $a0, prompt_b
	jal prompt
	nop

	# store user input in $t1
	or $t1, $zero, $v0
	
	# a * b
	mult $t0, $t1
	mflo $v0

	j show_and_end
	nop


prompt:
	# print $a0
	li  $v0, 4
	syscall

	# prompt user for an integer
	li $v0, 5
	syscall

	jr $ra
	nop
