Feature: Tablero
    Como jugador
    Quiero saber si es mi turno
    Para poder realizar mi jugada.

Scenario: siguiente turno
    Given un juego con dos jugadores inicio
    When ingresa el numero de caja "0" y la direccion de linea "arriba"
    Then deberia cambiar de turno