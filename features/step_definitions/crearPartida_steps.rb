Given("un jugador que esta creando una partida") do
    visit('/')
    click_button('Crear Partida')
  end
  
  Then("deberia ver las configuraciones de tamanhio del tablero y numero de jugadores") do
    page.find('form').find('select')
    page.find('form').find('input')   
  end