.data
    # Variables globales aqu�
    displayAddress: .word 0x10010000  # Direcci�n base del Bitmap Display

.text
main:
    # Inicializaci�n del juego
    jal initialize_game
    jal main_loop
    j exit

initialize_game:
    # Rutina para inicializar tableros, etc.
    jr $ra

main_loop:
    # L�gica principal del juego
    jr $ra

exit:
    li $v0, 10          # Syscall para terminar programa
    syscall