ori $t0, $zero, 19

slti $t1, $t0, 81
slti $t2, $t0, 60
xor  $t3, $t1, $t2 # $t0 <= 80 && !($t0 < 40)
bgtz $t3, in

slti $t1, $t0, 41
slti $t2, $t0, 20
xor  $t3, $t1, $t2  # $t0 <= 40 && !($t0 < 20)
bgtz $t3, in

	out: ori $t1, $zero, 0
       j end
       nop
   in: ori $t1, $zero, 1
  end: