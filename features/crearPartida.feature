Feature: CrearPartida
    Como jugador 
    Quiero configurar mi partida
    Para jugar con configuraciones de mi agrado

    Scenario: configuracion de la partida
        Given un jugador que esta creando una partida
        Then deberia ver las configuraciones de tamanhio del tablero y numero de jugadores
