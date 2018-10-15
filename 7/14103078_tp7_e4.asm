.data
      vector: .word 1,2,3,4,5
      last_index: .word 4

.text
      lui  $t0, 0x1001     # memory pointer
      lw   $t1, last_index # upper pointer multiplier
      sll  $t1, $t1, 2
      li   $t2, 0          # lower pointer multiplier

loop: bge $t2, $t1, end # if lower* > upper*, goto end
      nop

      add $t3, $t0, $t2 # get lower pointer
      lw  $t4, 0($t3)

      add $t5, $t0, $t1 # get upper pointer
      lw  $t6, 0($t5)

      sw $t4, 0($t5)
      sw $t6, 0($t3)

      addi $t2, $t2, 4
      subi $t1, $t1, 4
      j loop
      nop

 end: nop