.data
    # Variables globales aquí
    displayAddress: .word 0x10010000  # Dirección base del Bitmap Display

.text
main:
    # Inicialización del juego
    jal initialize_game
    jal main_loop
    j exit

initialize_game:
    # Rutina para inicializar tableros, etc.
    jr $ra

main_loop:
    # Lógica principal del juego
    jr $ra

exit:
    li $v0, 10          # Syscall para terminar programa
    syscall