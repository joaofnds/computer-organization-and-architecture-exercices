.data
  vector: .word 3, 7, 4, 9, 5, 2, 6
  length: .word 7

.text
main:
  la $a0, vector # load vector address
  lw $a1, length # load vector length

  jal insertion_sort
  nop

  li $v0, 10
  syscall

insertion_sort:
  li $t0, 1 # counter
  or $t5, $0, $a0 # *index pointer

  walk_loop:
    beq $t0, $a1, return # if counter > length(vector), return
    nop

		addi $t0, $t0, 1  # counter++
    addi, $t5, $t5, 4 # (*index)++
    or $t1, $0, $t5 # pivot = index

    swap_loop:
      beq $t1, $a0, walk_loop # if pivot = arr
      nop

      lw  $t3, ($t1)   # $t3 = *pivot
      lw  $t4, -4($t1) # $t4 = *(pivot-1)

      bgt $t3, $t4, walk_loop
      nop

      sw $t4, ($t1)
      sw $t3, -4($t1)

      sub $t1, $t1, 4

      j swap_loop
      nop

  return:
    jr $ra
    nop