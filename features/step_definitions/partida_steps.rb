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


  When("ingresa el numero de caja {string} y la direccion de linea {string}") do |caja, dirLinea|
    fill_in(id: 'numCaja', :with => caja)
    page.select dirLinea, from: 'direccionLinea'
    click_on(id: 'realizarJugada')
   end
   
   Then("se deberia dibujar una linea entre esos puntos") do
     page.assert_all_of_selectors('span.azul',count: 1)
   end
   


