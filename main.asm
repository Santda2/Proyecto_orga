#pixeles 16*16
#512*256
.data
    #Configuraciones
    display_width:  .word 32      # Ancho en celdas 16x16
    display_height: .word 16      # Alto en celdas
    display_base:   .word 0x10010000  # Dirección base
    game_mode:      .word 0       # 0 = no seleccionado, 1 = PvP, 2 = PvCPU
    
    #Colores
    color_water:    .word 0x0000FF  # Azul
    color_ship:     .word 0x808080  # Gris
    color_hit:      .word 0xFF0000  # Rojo
    color_miss:     .word 0xFFFFFF  # Blanco
    color_select:   .word 0xFFFF00  # Amarillo
    color_border:   .word 0x000000  # Negro
    color_text:     .word 0x00FF00  # Verde
    
    # Mensajes
    msg_title:      .asciiz "\n\nBATTLE SHIP MIPS\n"
    msg_modes:      .asciiz "\nSeleccione el modo de juego:\n1. Player vs Player (PvP)\n2. Player vs CPU (PvCPU)\n"
    msg_prompt:     .asciiz "\nIngrese su eleccion (1 o 2): "
    msg_invalid:    .asciiz "\nOpcion invalida. Por favor ingrese 1 o 2.\n"
    msg_selected:   .asciiz "\nModo seleccionado: "
    msg_pvp:        .asciiz "Player vs Player"
    msg_pvcpu:      .asciiz "Player vs CPU"
    msg_water:      .asciiz "\n\nTablero inicializado (todo azul - agua)\n"

.text
init_game:
    # Inicialización del juego
    jal show_menu          # Mostrar menú de selección
    jal select_game_mode   # Seleccionar modo de juego
    jal init_display       # Inicializar el bitmap display
    
    j game_loop           # Entrar al bucle principal

game_loop:

    #TODO el juego principañ
    
    j end_game

end_game:
    # Terminar el programa
    li $v0, 10
    syscall

# --------------------------------------------------
# Funciones de inicialización
# --------------------------------------------------

# Muestra el menú de selección de modo
show_menu:
    li $v0, 4
    la $a0, msg_title
    syscall
    la $a0, msg_modes
    syscall
    jr $ra

# Permite al usuario seleccionar el modo de juego
select_game_mode:
    li $v0, 5           # Leer entero del usuario
    syscall
    
    # Validar entrada
    li $t0, 1
    beq $v0, $t0, set_pvp_mode
    li $t0, 2
    beq $v0, $t0, set_pvcpu_mode
    
    # Entrada inválida
    li $v0, 4
    la $a0, msg_invalid
    syscall
    j select_game_mode   # Volver a intentar
    
set_pvp_mode:
    li $t0, 1
    sw $t0, game_mode
    li $v0, 4
    la $a0, msg_selected
    syscall
    la $a0, msg_pvp
    syscall
    jr $ra
    
set_pvcpu_mode:
    li $t0, 2
    sw $t0, game_mode
    li $v0, 4
    la $a0, msg_selected
    syscall
    la $a0, msg_pvcpu
    syscall
    jr $ra

# Inicializa el bitmap display
init_display:
    la $t0, display_base
    lw $t0, 0($t0)      
    lw $t1, color_water
    li $t2, 0            # Contador
    
    li $t3, 512          # Total de celdas (32x16)
    
init_loop:		 # loop para cargar el color base
    sw $t1, 0($t0)       
    addi $t0, $t0, 4     
    blt $t2, $t3, init_loop
    
    jr $ra
