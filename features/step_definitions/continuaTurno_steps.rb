Then("deberia continuar en el turno del jugador que hizo el punto") do
    page.find('.turnoJugador').has_css?('background-color:blue')   
  end