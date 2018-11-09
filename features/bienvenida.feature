Feature: Bienvenida
    Como jugador 
    Quiero ver un mensaje de bienvenida al juego 
    Para sentirme a gusto desde el inicio

    Scenario: mensaje de bienvenida
        Given visito la pagina principal
        Then deberia ver el mensaje "¡Bienvenido a puntos y cajas!"

   Scenario: Boton crear partida
        Given visito la pagina principal
        When presiono el boton "Crear Partida"
        Then deberia redirigirme a la pagina con la url "/configuracion"