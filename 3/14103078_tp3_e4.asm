ori $t1, $zero, 2 # b
ori $t2, $zero, 3 # h

mult $t1, $t2     # b * h

mflo $t3          # $t3 = b * h
srl $t3, $t3, 1   # $t3 = $t3 / 2
