Given("un jugador que inicio una partida") do
  page.driver.post('/iniciarPartida?tamTablero=4&numJugadores=2')
end

Then("deberia ver el tablero") do
  page.assert_all_of_selectors('div.caja', count: 9)
end


   


