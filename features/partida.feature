Feature: Tablero
    Como jugador
    Quiero ver el tablero
    Para ver la situacion actual de la partida.

    Scenario: se inicio una partida
        Given un jugador que inicio una partida
        Then deberia ver el tablero
    
    Scenario: un jugador hace una jugada
        Given un jugador que esta en medio de una partida
        When ingresa el numero de caja "0" y la direccion de linea "arriba"
        Then se deberia dibujar una linea entre esos puntos

    Scenario: jugador gana un punto
        Given un juego con dos jugadores inicio
        When ingresa la linea que completa cuadrado en la posicion "0" y la direccion de linea "arriba"
        Then se deberia dibujar un "1" debajo de su nombre

    Scenario: jugador completa un cuadrado
        Given un juego con dos jugadores inicio
        When ingresa la linea que completa cuadrado en la posicion "0" y la direccion de linea "arriba"
        Then se deberia pintar el cuadrado con el color del jugador

    Scenario: siguiente turno
        Given un juego con dos jugadores inicio
        When ingresa el numero de caja "0" y la direccion de linea "arriba"
        Then deberia cambiar de turo