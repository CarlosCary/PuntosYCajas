Feature: Tablero
    Como jugador
    Quiero ver el dibujar una linea
    Para poder jugar y ganar.
    
Scenario: un jugador hace una jugada
        When ingresa el numero de caja "0" y la direccion de linea "arriba"
        Then se deberia dibujar una linea en esa posicion