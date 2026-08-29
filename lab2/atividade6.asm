lw x11, HIGH       
lw x12, LOW         
lw x13, NUMBER      
lw x14, MAX         
loop:
    beq x11, x14, fim   # encerra o programa

on:
    sb   x11, 1029(x0)  # Acende o LED
    lb   x10, 1026(x0)  # Lê o estado do botão
    andi x10, x10, 0x1  # Isola o bit 0
    beq  x10, x13, off  # Se o botão foi pressionado (== 1), vai para 'off'
    jal  x0, on         

off:
    lb   x10, 1026(x0)
    andi x10, x10, 0x1
    beq  x10, x13, off 

    slli x11, x11, 1    # Avançar LED
    jal  x0, loop    

fim:
    sb   x11, 1029(x0)  # Mantém o LED 7 aceso
    halt                

# 
HIGH:   .word 1        
LOW:    .word 0         
NUMBER: .word 1         # Comparador do botão
MAX:    .word 32      
