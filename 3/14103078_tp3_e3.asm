# y = (9x+7) / (2x+8)
# Armazene o quociente da divisão em $t2 e o resto em $t3


# Responda o que acontece quando x = -4
# Acontece uma divisão por 0, produzindo infinito como resultado

ori $t1, $0, 6 # $t1 = 6

# 9x+7
ori $t2, $0, 9
mult $t1, $t2   # 9x
mflo $t2        # $t2 = 9x
addi $t2, $t2, 7 # $t2 += 7

# 2x+8
sll $t3, $t1,  1 # $t3 = 2x
addi $t3, $t3, 8 # $t3 += 8

div $t2, $t3

mflo $t2 # lo = quotient
mfhi $t3 # hi = remainder
