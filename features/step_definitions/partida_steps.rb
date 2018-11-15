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

When("ingresa las coordenadas de los puntos {string} {string} y {string} {string}") do |coordX, coordY, coordX2, coordY2|
  fill_in(id: 'posX', :with => coordX)
  fill_in(id: 'posY', :with => coordY)
  fill_in(id: 'posX2', :with => coordX2)
  fill_in(id: 'posY2', :with => coordY2)
  click_on(id: 'realizarJugada')end

Then("se deberia dibujar una linea entre esos puntos") do
  page.assert_all_of_selectors('span.azul',count: 1)
end
