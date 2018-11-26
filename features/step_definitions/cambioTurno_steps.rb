Then("deberia cambiar de turno") do
    page.find('.turnoJugador').has_css?('background-color:blue') 
  end