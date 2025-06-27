#Tama�o del pixel 16*16
#tama�o de la pantalla width 256, height 512
# tama�o final de 16*32

.data
    # Variables globales aqu�
display: .space 1024

.text
main:
    # Inicializaci�n del juego
    jal initialize_game
    jal main_loop
    j exit

initialize_game:
    li $t0 0x0000ff
    li $t1 0
	
    # Rutina para inicializar tableros, etc.
    jr $ra

main_loop:
    sw $t0 display($t1)
    addi $t1 $t1 4
    
    beq $t1 2048 exit
    
    j main_loop


    # L�gica principal del juego
    jr $ra

exit:
    li $v0, 10          # Syscall para terminar programa
    syscall