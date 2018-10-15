# Write initial 0x12345678 value
ori  $t1, $zero, 0x1234
sll  $t1, $t1,   0x10
ori  $t1, $t1,   0x5678

# $t1 is treated as a queue with the top being the LSB.
# $t1 is used just to dequeue
# The process of dequeuing consists of applying a mask of 0xf on $t1,
# storing the result in $t3 and shifting right $t1 in 4 bits

# $t2 is treated as a queue with the top being the LSB.
# $t2 is used just to enqueue
# The process of enqueuing consists of shifting left $t2 in 4 bits and
# making an or between $t2 and $t3 (storing the value in $t2)

# There's no need to store the initial value on $t3 because $t2 doens't
# hold any values yet

# "Dequeue" $t1 and store dequeued value directely on $t2
andi $t2, $t1,   0xf
srl  $t1, $t1,   0x4

# "Dequeue" $t1 and store dequeued value on $t3
andi $t3, $t1,   0xf
srl  $t1, $t1,   0x4

# "Enqueue" $t3 on $t2
sll  $t2, $t2,   0x4
or   $t2, $t2,   $t3

# "Dequeue" $t1 and store dequeued value on $t3
andi $t3, $t1,   0xf
srl  $t1, $t1,   0x4

# "Enqueue" $t3 on $t2
sll  $t2, $t2,   0x4
or   $t2, $t2,   $t3

# "Dequeue" $t1 and store dequeued value on $t3
andi $t3, $t1,   0xf
srl  $t1, $t1,   0x4

# "Enqueue" $t3 on $t2
sll  $t2, $t2,   0x4
or   $t2, $t2,   $t3

# "Dequeue" $t1 and store dequeued value on $t3
andi $t3, $t1,   0xf
srl  $t1, $t1,   0x4

# "Enqueue" $t3 on $t2
sll  $t2, $t2,   0x4
or   $t2, $t2,   $t3

# "Dequeue" $t1 and store dequeued value on $t3
andi $t3, $t1,   0xf
srl  $t1, $t1,   0x4

# "Enqueue" $t3 on $t2
sll  $t2, $t2,   0x4
or   $t2, $t2,   $t3

# "Dequeue" $t1 and store dequeued value on $t3
andi $t3, $t1,   0xf
srl  $t1, $t1,   0x4

# "Enqueue" $t3 on $t2
sll  $t2, $t2,   0x4
or   $t2, $t2,   $t3

# "Dequeue" $t1 and store dequeued value on $t3
andi $t3, $t1,   0xf
srl  $t1, $t1,   0x4

# "Enqueue" $t3 on $t2
sll  $t2, $t2,   0x4
or   $t2, $t2,   $t3
