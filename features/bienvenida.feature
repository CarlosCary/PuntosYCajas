Feature: Bienvenida
    Como estudiante 
    Quiero ver un mensaje de bienvenida en la calculadora 
    Para sentirme a gusto desde el inicio

    Scenario: mensaje de bienvenida
        Given visito la pagina principal
        Then deberia ver el mensaje "bienvenido a la calculadora"
    
    Scenario: boton iniciar
        Given visito la pagina principal
        When presiono el boton "Iniciar"
        Then deberia ver la pagina con titulo "Sumar"