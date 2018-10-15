.data
	string: .asciiz "Eu amo muito meu professor de AOC-I."

.text
	lui  $t0, 0x1001
	lui  $t1, 0x1001
	li   $t9, 0x20   # Space
	
loop:  lbu $t2, 0($t0)

       beq $t2, $zero, end
       nop
      
       beq $t2, $t9, space
       nop
      
     	 j write
     	 nop
      
space: addi $t0, $t0, 1
			 j loop
			 nop
 
write: sb   $t2, 0($t1)
			 addi $t0, $t0, 1
       addi $t1, $t1, 1
      
       j loop
       nop

end:   sb $t2, 0($t1)
