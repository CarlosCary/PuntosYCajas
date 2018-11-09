Given("un jugador que esta creando una partida") do
    visit('/')
  end

Then("deberia poder ingresar las configuraciones para el juego que desee") do
    click_button('Crear Partida')
    page.find('form').find('select')
    page.find('form').find('input')
    page.select '2', from: 'numJugadores' 
    page.fill_in 'tamTablero', with: '4'
  end