Given("un jugador que inicio una partida") do
    visit('/partida')
end

Then("deberia ver el tablero vacio") do
  page.assert_all_of_selectors('span.apagado', count: 28)
end

Given("un jugador que esta en medio de una partida") do
  visit('/partidaJugando')
end

Then("deberia ver el tablero con las jugadaras realizadas") do
  page.assert_all_of_selectors('span.azul', count: 1)
end

Then("deberia poder insertar las coordenadas de los puntos de la linea") do
  page.assert_all_of_selectors('input', count: 5)
  fill_in(id: 'posX', :with => '0')
  fill_in(id: 'posY', :with => '0')
  fill_in(id: 'posX2', :with => '0')
  fill_in(id: 'posY2', :with => '1')
  click_on(id: 'realizarJugada')
end