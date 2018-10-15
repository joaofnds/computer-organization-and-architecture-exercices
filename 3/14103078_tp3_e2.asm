# y = 3x^2 - 5x + 13

ori  $t5, $0,  3   # x=2

ori  $t1, $0,  3
mult $t5, $t5
mflo $t2
mult $t1, $t2
mflo $t1           # $t1 = 3x^2

ori  $t3,  $0, 5   # $t3 = 5
sub  $t2,  $0, $t3 # $t2 = -5
mult $t2, $t5      # -5x
mflo $t2           # $t2 = -5x

addi $t6, $t2,  13 # $t6 = -5x + 13
add  $t6, $t6, $t1 # $t6 += $t1 