# Nro. Op             1          2          3          4          5
# Operando 1          0x0100     0x0FFF     0xFF00     0x8000     0xFFFFF888
# Bits Significativos 9          12         16         16         32
# Operando 2          0x1000     0x0FFF     0xFFFF     0x1000     0x3333
# Bits Significativos 13         12         16         13         14
# Produto (alta)      0x00000000 0x00000000 0x00000000 0x00000000 0xffffffff
# Produto (baixa)     0x00100000 0x00ffe001 0xfeff0100 0x08000000 0xfe819b18
# Bits Significativos 21         24         32         28         64

# Operação 1
ori $t1, $zero, 0x0100
ori $t2, $zero, 0x1000
mult $t1, $t2
mfhi $t1
mflo $t2

# Operação 2
ori $t3, $zero, 0x0FFF
ori $t4, $zero, 0x0FFF
mult $t3, $t4
mfhi $t3
mflo $t4

# Operação 3
ori $t5, $zero, 0xFF00
ori $t6, $zero, 0xFFFF
mult $t5, $t6
mfhi $t5
mflo $t6

# Operação 4
ori $t7, $zero, 0x8000
ori $t8, $zero, 0x1000
mult $t7, $t8
mfhi $t7
mflo $t8

# Operação 5
ori $t9, $zero, 0xFFFF
sll $t9  $t9,   0x10
ori $t9, $t9,   0xF888
ori $t0, $zero, 0x3333
mult $t9, $t0
mfhi $t9
mflo $t0