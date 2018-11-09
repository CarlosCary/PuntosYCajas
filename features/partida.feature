Feature: Tablero
    Como jugador
    Quiero ver el tablero
    Para ver la situacion actual de la partida.

    Scenario: se inicio una partida
        Given un jugador que inicio una partida
        Then deberia ver el tablero vacio

    Scenario: se esta jugando una partida
        Given un jugador que esta en medio de una partida
        Then deberia ver el tablero con las jugadaras realizadas
    
    Scenario: un jugador hace una jugada
        Given un jugador que esta en medio de una partida
        Then deberia poder insertar las coordenadas de los puntos de la linea