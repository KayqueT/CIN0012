lw x19, f
lw x20, g
lw x21, h
lw x22, i
lw x23, j

beq x22, x23, se # if i = j, go to the end

sub x19, x20, x21
sw x19, f
halt

se:
add x19, x20, x21
sw x19, f
halt

g: .word 2 
h: .word 2 
i: .word 2 
j: .word 2 
f: .word 0x0000 # 









