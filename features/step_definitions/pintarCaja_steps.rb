

Then("se deberia pintar el cuadrado con el color del jugador") do
    page.find('#tablero').first(".caja").has_css?('background-color:blue')
  end