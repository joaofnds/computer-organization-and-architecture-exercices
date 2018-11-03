.data
		.space 256
string_km:
		.asciiz "\nQuilometros percorridos?\n"
string_l:
		.asciiz "Litros consumidos?\n"
string_result:
		.asciiz "Média de consumo: "

.text
main:
		lui $s0, 0x1001
loop:
		la  $a0, string_km # load prompt string
		jal prompt         # prompt Km
		nop
		or  $s1, $0, $v0   # store Km in $s0
			
		beq $s1, $0, exit  # exit if km equal 0
		nop
			
		la  $a0, string_l  # load prompt string
		jal prompt         # prompt liters
		nop
		or  $s2, $0, $v0   # store liters in $s1
			
		div  $s1, $s2      # calc rate
		mflo $s3

		jal display_result
		nop

		sw   $s3, 0($s0)
		addi $s0, $s0, 4
			
		j loop
		nop

exit:
		li $v0, 10
		syscall

prompt:
		li  $v0, 4
		syscall

		li $v0, 5
		syscall

		jr $ra
		nop

display_result:
		la $a0, string_result
		li $v0, 4
		syscall
		
		or $a0, $0, $s3
		li $v0, 1
		syscall

		jr $ra
		nop
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
