addi x11, x0, 42 # Carrega '*'(42) em ASCII em x11
loop:
    lb   x10, 1025(x0)   # Lê a entrada
    beq  x10, x11, fim   # Se x10 == '*', salta para o fim
    sb   x10, 1024(x0)   # Imprime antes do '*'
    jal  x0, loop       
fim:
    halt                 
