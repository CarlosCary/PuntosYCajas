Given("un jugador que inicio una partida") do
  page.driver.post('/iniciarPartida?tamTablero=4&numJugadores=2')
end

Then("deberia ver el tablero") do
  page.assert_all_of_selectors('div.caja', count: 9)
end

Given("un jugador que esta en medio de una partida") do
  visit('/partidaJugando1')
end

When("ingresa el numero de caja {string} y la direccion de linea {string}") do |caja, dirLinea|
    page.driver.post('/partidaJugando1?numeroCaja=caja&direccionLinea=dirLinea')
    fill_in(id: 'numCaja', :with => caja)
    page.select dirLinea, from: 'direccionLinea'
    click_on(id: 'realizarJugada')
end
   
Then("se deberia dibujar una linea entre esos puntos") do
  page.find('#tablero').first(".caja").has_css?('border-top-color:red')
end

Given("un juego con dos jugadores inicio") do
  page.driver.post('/iniciarPartida?tamTablero=4&numJugadores=2')
end

When("ingresa la linea que completa cuadrado en la posicion {string} y la direccion de linea {string}") do |caja, dirLinea|
  page.driver.post('/partidaJugando1?numeroCaja=0&direccionLinea=abajo')
  fill_in(id: 'numCaja', :with => 0)
  page.select 'abajo', from: 'direccionLinea'
  click_on(id: 'realizarJugada')
  page.driver.post('/partidaJugando1?numeroCaja=0&direccionLinea=derecha')
  fill_in(id: 'numCaja', :with => 0)
  page.select 'derecha', from: 'direccionLinea'
  click_on(id: 'realizarJugada')
  page.driver.post('/partidaJugando1?numeroCaja=0&direccionLinea=izquierda')
  fill_in(id: 'numCaja', :with => 0)
  page.select 'izquierda', from: 'direccionLinea'
  click_on(id: 'realizarJugada')
  page.driver.post('/partidaJugando1?numeroCaja=caja&direccionLinea=dirLinea')
  fill_in(id: 'numCaja', :with => caja)
  page.select dirLinea, from: 'direccionLinea'
  click_on(id: 'realizarJugada')
end

Then("se deberia dibujar un {string} debajo de su nombre") do |puntaje|
  find_all('.puntaje').to_a.last.value() == puntaje
end

Then("se deberia pintar el cuadrado con el color del jugador") do
  page.find('#tablero').first(".caja").has_css?('background-color:blue')
end

Then("deberia cambiar de turo") do
  page.find('.turnoJugador').has_css?('background-color:blue') 
end

Then("deberia continuar en el tueno del jugador que hizo el punto") do
  page.find('.turnoJugador').has_css?('background-color:blue')   
end


