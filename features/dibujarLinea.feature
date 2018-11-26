Feature: Tablero
    Como jugador
    Quiero dibujar una linea
    Para poder jugar y aumentar mis posibilidades de ganar.
    
Scenario: un jugador hace una jugada
        When ingresa el numero de caja "0" y la direccion de linea "arriba"
        Then se deberia dibujar una linea en esa posicion