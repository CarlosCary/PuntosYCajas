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
