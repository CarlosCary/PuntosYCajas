Feature: Tablero
    Como jugador
    Quiero completar un cuadrado
    Para aumentar mis posibilidades de ganar.

Scenario: jugador gana un punto
    Given un juego con dos jugadores inicio
    When ingresa la linea que completa cuadrado en la posicion "0" y la direccion de linea "arriba"
    Then se deberia dibujar un "1" debajo de su nombre