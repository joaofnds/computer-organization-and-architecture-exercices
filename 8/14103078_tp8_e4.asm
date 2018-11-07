.data
  vector: .word 3, 8, 7, 4, 9, 5, 2, 6, 1

.text
main:
  la $a0, vector # load vector address
  li $a1, 8      # last index

  jal insertion_sort
  nop

  li $v0, 10
  syscall

insertion_sort:
  or  $t0, $0,  $a0 # index pointer
  sll $t1, $a1, 2   # multiply by 4 to get length in bits
  add $t1, $t0, $t1 # vector end pointer

  walk_loop:
    beq $t0, $t1, return # if index_pointer > vector_end_pointer, return
    nop

    addi $t0, $t0, 4   # index++
    or   $t2, $0,  $t0 # pivot = index

    swap_loop:
      beq $t2, $a0, walk_loop # if pivot = vector
      nop

      lw  $t3, ($t2)   # $t3 = *pivot
      lw  $t4, -4($t2) # $t4 = *(pivot-1)

      bgt $t3, $t4, walk_loop
      nop

      sw $t4, ($t2)
      sw $t3, -4($t2)

      sub $t2, $t2, 4

      j swap_loop
      nop

  return:
    jr $ra
    nop
