.text
	lui $s0, 0x1001
	li  $s1, 0xA    # newline ASCII code
	li  $s2, 65     # 'A' ASCII code
	li  $s3, 91     # 'Z' ASCII code + 1
	li  $s4, 97     # 'a' ASCII code
	li  $s5, 123    # 'z' ASCII code + 1
	li  $s6, 0x20   # 'a' - 'A' offset between upper and lower case

	# read_string($s0, 4096)
	or $a0, $zero, $s0
	ori $a1, $zero, 0x1000
	li $v0, 8
	syscall

	loop:
		lbu $t0, ($s0)

		beq $t0, $zero, exit # exit if $t0 == '\0'
		nop

		beq $t0, $s1, continue # continue if $t0 == '\n'
		nop

		blt $t0, $s2, continue # continue if $t0 < 'A'
		nop

		blt $t0, $s3, make_lowercase # make_lowercase if $t0 <= 'Z'
		nop

		blt $t0, $s4, continue # continue if $t0 < 'a'
		nop

		blt $t0, $s5, make_uppercase # make_uppercase if $t0 <= 'z'
		nop

		continue:
			addi $s0, $s0, 1 # increment pointer
			j loop
			nop

		make_uppercase:
			sub $t0, $t0, $s6 # $t0 -= 32
			sb  $t0, ($s0)
			j continue
			nop

		make_lowercase:
			add $t0, $t0, $s6 # $t0 += 32
			sb  $t0, ($s0)
			j continue
			nop:

	exit:
		li $v0, 4
		lui $a0, 0x1001
		syscall

		li $v0, 10
		syscall
