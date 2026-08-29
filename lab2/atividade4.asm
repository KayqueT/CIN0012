lw x7, k
addi x13, x0, 1

loop:
    lb   x11, 0(x7)
    beq  x11, x0, fim
    sb   x11, 1024(x0)
    addi x7, x7, 1
    bne  x0, x13, loop

fim:
    halt
str1: .string "Hello World"
k: .word 32   
