Given("un jugador que inicio una partida") do
  page.driver.post('/iniciarPartida?tamTablero=4&numJugadores=2')
end

Then("deberia ver el tablero") do
  page.assert_all_of_selectors('div.caja', count: 9)
end

When("ingresa el numero de caja {string} y la direccion de linea {string}") do |caja, dirLinea|
    page.driver.post('/partidaJugando1?numeroCaja=caja&direccionLinea=dirLinea')
    fill_in(id: 'numCaja', :with => caja)
    page.select dirLinea, from: 'direccionLinea'
    click_on(id: 'realizarJugada')
end
   


