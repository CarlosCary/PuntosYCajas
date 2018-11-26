Feature: Tablero
    Como jugador
    Quiero que mi turno siga cuando realizo un punto
    Para poder seguir realizando jugadas.

Scenario: continuar con el turno
    Given un juego con dos jugadores inicio
    When ingresa la linea que completa cuadrado en la posicion "0" y la direccion de linea "arriba"
    Then deberia continuar en el turno del jugador que hizo el punto