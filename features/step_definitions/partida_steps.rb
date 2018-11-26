Given("un jugador que inicio una partida") do
  page.driver.post('/iniciarPartida?tamTablero=4')
end

Then("deberia ver el tablero") do
  page.assert_all_of_selectors('div.caja', count: 9)
end

Given("un jugador que esta en medio de una partida") do
  visit('/partidaJugando')
end


  When("ingresa el numero de caja {string} y la direccion de linea {string}") do |caja, dirLinea|
    fill_in(id: 'numCaja', :with => caja)
    page.select dirLinea, from: 'direccionLinea'
    click_on(id: 'realizarJugada')
   end
   
   Then("se deberia dibujar una linea entre esos puntos") do
     page.find('#tablero').first(".caja").has_css?('border-top-color:red')
   end
   


