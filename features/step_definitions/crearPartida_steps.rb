


  Given("un jugador que esta creando una partida") do
    visit('/')
    click_button('Crear Partida')
  end
  
  Then("deberia ver las configuraciones de tamanhio del tablero y numero de jugadores") do
    page.find('form').find('select')
    page.find('form').find('input')   
  end

  Given("un jugador se encuentra configurando una partida") do
    visit('/')
    click_button('Crear Partida')   
  end
    
  When("preciono el boton {string}") do |iniciar|
    click_button(iniciar)

  end
  
  Then("deberia redirigirse a la pagina {string} para iniciar una partida") do |url|
    page.assert_current_path(url)   
  end