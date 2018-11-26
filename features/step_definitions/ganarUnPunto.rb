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