#Tama�o del pixel 16*16
#tama�o de la pantalla width 256, height 512
# tama�o final de 16*32

.data
    player1_board: .space 1024   # 16x32 = 512 words (2048 bytes)
    player2_board: .space 1024
    
    cpu_board:     .space 1024   # Para modo PvCPU
    current_player: .word 1      # 1 o 2
    game_mode:      .word 0      # 0 = PvP, 1 = PvCPU
    
    # Colores
    water_color:   .word 0x0000FF #azul
    ship_color:    .word 0x808080 #Gris
    hit_color:     .word 0xFF0000 #Rojo
    miss_color:    .word 0xFFFFFF #Blanco
    select_color:  .word 0xFFFF00 #Amarillo


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
