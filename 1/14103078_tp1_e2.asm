# Because we want to write 32 bits to $t1 and the `ori` opcode only allows us to write
# a max of 16 bits, we need to split this into two writes
ori $t1, $zero, 0xAAAA  # Write first 16 bits
sll $t1, $t1  , 16      # Shift previous written values
ori $t1, $t1  , 0xAAAA    # Complete $t1 write by rewriting first 16 bits
srl $t2, $t1  , 1       # Shift $t1 by 1 bit (divide by 2) - 0XAAAA / 0x2 = 0x5555

# $t1 = 1010 1010 1010 1010 - 0xAAAA
# $t2 = 0101 0101 0101 0101 - 0x5555


#    1010 1010 1010 1010
# or 0101 0101 0101 0101
#    -------------------
# 	 1111 1111 1111 1111 - 0xFFFF
or  $t3, $t1  , $t2

#     1010 1010 1010 1010
# and 0101 0101 0101 0101
#     -------------------
#     0000 0000 0000 0000 - 0x0000
and $t4, $t1  , $t2

#     1010 1010 1010 1010
# xor 0101 0101 0101 0101
#     -------------------
#     1111 1111 1111 1111 - 0xFFFF
xor $t5, $t1  , $t2