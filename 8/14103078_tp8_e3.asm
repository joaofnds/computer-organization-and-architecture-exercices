.data
	prompt_str: .asciiz "insira um valor inteiro: "
	result_str: .asciiz "média: "
.text

main:
		la $a0, prompt_str # prompt first number
		jal prompt
		nop
		or  $s0, $0, $v0   # store input in $s0
		
		la $a0, prompt_str # prompt second number
		jal prompt
		nop
		or  $s1, $0, $v0   # store input in $s1
		
		la $a0, prompt_str # prompt third number
		jal prompt
		nop
		or  $s2, $0, $v0   # store input in $s2


		# call average with user input
		or  $a0, $0, $s0
		or  $a1, $0, $s1
		or  $a2, $0, $s2
		jal average
		nop
		
		# call display_result with average return value
		or $a0, $0, $v0
		jal display_result
		nop
		
		j exit
		nop

average:
		or  $t0, $0, $0   # result acc
		ori $t1, $0, 3    # divider

		add $t0, $t0, $a0 # acc += argument_1
		add $t0, $t0, $a1 # acc += argument_2
		add $t0, $t0, $a2 # acc += argument_3
		
		div $t0, $t1      # acc /= 3
		mflo $v0
		
		jr $ra
		nop

prompt:
		li $v0, 4 # print first argument
		syscall

		li $v0, 5  # read int
		syscall

		jr $ra
		nop

display_result:
		or  $t0, $0, $a0 # store first argument temporarily

		ori $v0, $0, 4
		la  $a0, result_str
		syscall


		or  $a0, $0, $t0 # set temp. stored argument as syscall argument
		ori $v0, $0, 1   # print int
		syscall
		
		jr $ra
		nop

exit:
		ori $v0, $0, 10
		syscall
