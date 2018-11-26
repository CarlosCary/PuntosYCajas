Feature: Tablero
    Como jugador
    Quiero ver el tablero
    Para ver la situacion actual de la partida.

    Scenario: se inicio una partida
        Given un jugador que inicio una partida
        Then deberia ver el tablero
    
    Scenario: siguiente turno
        Given un juego con dos jugadores inicio
        When ingresa el numero de caja "0" y la direccion de linea "arriba"
        Then deberia cambiar de turno

    
    