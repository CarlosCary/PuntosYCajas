Feature: Bienvenida
    Como jugador
    Quiero ver el tablero
    Para ver la situacion actual de la partida.

    # Scenario: se esta jugando una partida
    #     Given jugador que esta en una partida
    #     Then deberia ver el tablero con las jugadas realizadas por todos los jugadores
    Scenario: se inicio una partida
        Given un jugador que inicio una partida
        Then deberia ver el tablero vacio